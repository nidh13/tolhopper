import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/checkout/presentation/checkout_ui.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';
import 'package:tollhopper/core/services/injection_container.dart';

class CheckoutPage extends StatefulWidget {
  final String token;
  final UserModel userModel;
  final String licencePate;
  final String licencePateRegEx;
  final String countryLicencePate;
  const CheckoutPage({
    Key? key,
    required this.token,
    required this.licencePate,
    required this.userModel,
    required this.countryLicencePate,
    required this.licencePateRegEx,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String totalAmount = "0";
  List<CartModel> _cart = [];
  final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CartBloc>()..add(GetProductsFromCartEvent()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) async {
              if (state is CartSuccessState) {
                updateCart(
                    price: state.price,
                    list: state.listItems,
                    productNumber: state.listItems.length.toString());
              }
            },
          ),
        ],
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CheckoutUi(
              backButton: () => backButton(context),
              licensePateNumber: widget.licencePate,
              fullName: widget.userModel.getFullName(),
              address: widget.userModel.getFullAdress(),
              time: formattedTime,
              date: formattedDate,
              totalAmount: totalAmount,
              checkoutFunction: goToPaymentMethode,
              cart: _cart,
            );
          },
        ),
      ),
    );
  }

  void goToPaymentMethode() {
    Navigator.pushNamed(
      context,
      paymentMethode,
      arguments: PaymentMethodeParams(
        userModel: widget.userModel,
        token: widget.token,
        licencePate: widget.licencePate,
        countryLicencePate: widget.countryLicencePate,
        totalAmount: totalAmount,
        cart: _cart,
        licencePateRegEx: widget.licencePateRegEx,
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void updateCart({
    required String price,
    required String productNumber,
    required List<CartModel> list,
  }) {
    setState(() {
      totalAmount = price;
      _cart = list;
    });
  }
}
