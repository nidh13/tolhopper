import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/checkout/presentation/bloc/app_payment_bloc.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/payment_method/presentation/payment_methode_ui.dart';
import 'package:tollhopper/features/payment_method/presentation/widget/enum/payment_method_enum.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';
import 'package:tollhopper/core/services/injection_container.dart';

class PaymentMethodePage extends StatefulWidget {
  final String token;
  final UserModel userModel;
  final String licencePate;
  final String pateLicenceRegEx;
  final String countryLicencePate;
  final String totalAmount;
  final List<CartModel> cart;
  const PaymentMethodePage({
    Key? key,
    required this.userModel,
    required this.token,
    required this.licencePate,
    required this.countryLicencePate,
    required this.totalAmount,
    required this.cart,
    required this.pateLicenceRegEx,
  }) : super(key: key);

  @override
  State<PaymentMethodePage> createState() => _PaymentMethodePageState();
}

class _PaymentMethodePageState extends State<PaymentMethodePage> {
  int paymentMethodSelected = 0;
  String? _stripeIntentId;
  String? _paypalPaymentId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AppPaymentBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppPaymentBloc, AppPaymentState>(
            listener: (context, state) async {
              if (state is AppPaymentSuccess) {
                goToOrderSummary(context);
              } else if (state is StripePaymentSuccess) {
                if (state.intentId != null) {
                  _stripeIntentId = state.intentId;
                  confirmPayment(
                    sessionId: state.intentId!,
                    status: "draft",
                    type: "stripe",
                    cart: "stripe",
                    context: context,
                  );
                }
              } else if (state is PaypalPaymentSuccess) {
                if (state.paymentId != null) {
                  _paypalPaymentId = state.paymentId;
                  confirmPayment(
                      sessionId: state.paymentId!,
                      status: "paid",
                      type: "paypal",
                      cart: "paypal",
                      context: context);
                }
              } else if (state is AppPaymentError) {
                handleAppPaymentError(context: context, appPaymentError: state);
              } else if (state is StripePaymentError) {
                handleStripePaymentError(
                    context: context, stripePaymentError: state);
              } else if (state is PayPalPaymentError) {
                handlePayPalPaymentError(
                    context: context, palPaymentError: state);
              }
            },
          ),
        ],
        child: BlocBuilder<AppPaymentBloc, AppPaymentState>(
          builder: (context, state) {
            return PaymentMethodeUi(
              backButton: () => backButton(context),
              selectPaymentMethod: updatePaymentMethod,
              indexSelected: paymentMethodSelected,
              proceedToCheckout: () => pay(context),
              isLoading: (state is AppPaymentPackageLoading ||
                  state is AppPaymentLoading),
            );
          },
        ),
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void updatePaymentMethod(int newValue) {
    setState(() {
      paymentMethodSelected = newValue;
    });
  }

  void pay(BuildContext context) {
    if (paymentMethodSelected == PaymentMethodEnum.paypal.index) {
      payPalCheckoutFunction(context);
    } else if (paymentMethodSelected == PaymentMethodEnum.creditCard.index) {
      stripeCheckoutFunction(context);
    }
  }

  void stripeCheckoutFunction(BuildContext context) {
    BlocProvider.of<AppPaymentBloc>(context).add(
      PayWithStripeEvent(
          amount: widget.totalAmount,
          currency: "EUR",
          customerId: widget.userModel.id ?? ""),
    );
  }

  void payPalCheckoutFunction(BuildContext context) {
    BlocProvider.of<AppPaymentBloc>(context).add(
      PayWithPayPalEvent(
        amount: widget.totalAmount,
        currency: "EUR",
        context: context,
      ),
    );
  }

  void goToOrderSummary(BuildContext context) {
    Navigator.pushNamed(
      context,
      orderSummaryPage,
      arguments: OrderSummaryParams(
        cart: widget.cart,
        userModel: widget.userModel,
        licencePate: widget.licencePate,
        totalAmount: widget.totalAmount,
      ),
    );
  }

  void confirmPayment({
    required BuildContext context,
    required String sessionId,
    required String type,
    required String cart,
    required String status,
  }) {
    BlocProvider.of<AppPaymentBloc>(context).add(
      ConfirmPaymentApiEvent(
        pateLicenceCodeCountry: widget.countryLicencePate,
        pateLicence: widget.licencePate,
        card: cart,
        cart: widget.cart,
        type: type,
        language: getLocaleLanguageCode(context),
        status: status,
        sessionId: sessionId,
        customerId: widget.userModel.id ?? "",
        pateLicenceRegEx: widget.pateLicenceRegEx,
      ),
    );
  }

  Future<void> handleAppPaymentError(
      {required AppPaymentError appPaymentError,
      required BuildContext context}) async {
    bool result;
    if (appPaymentError.isInternetFailure) {
      result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
    } else {
      result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
    }
    if (result) {
      if (appPaymentError.type == "stripe" && _stripeIntentId != null) {
        confirmPayment(
            sessionId: _stripeIntentId!,
            status: "draft",
            type: "stripe",
            cart: "stripe",
            context: context);
      } else if (appPaymentError.type == "paypal" && _paypalPaymentId != null) {
        confirmPayment(
            sessionId: _paypalPaymentId!,
            status: "paid",
            type: "paypal",
            cart: "paypal",
            context: context);
      }
    }
  }

  Future<void> handleStripePaymentError(
      {required StripePaymentError stripePaymentError,
      required BuildContext context}) async {
    bool result;
    if (stripePaymentError.isInternetFailure) {
      result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
    } else {
      result = await DialogUtils.paymentErrorDialog(
          context: context, type: "stripe");
    }
    if (result) {
      stripeCheckoutFunction(context);
    }
  }

  Future<void> handlePayPalPaymentError(
      {required PayPalPaymentError palPaymentError,
      required BuildContext context}) async {
    bool result;
    if (palPaymentError.isInternetFailure) {
      result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
    } else {
      result = await DialogUtils.paymentErrorDialog(
          context: context, type: "paypal");
    }
    if (result) {
      payPalCheckoutFunction(context);
    }
  }
}
