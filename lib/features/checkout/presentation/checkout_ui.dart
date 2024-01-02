import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/checkout/presentation/widget/checkout_bottom/checkout_bottom_widget.dart';
import 'package:tollhopper/features/checkout/presentation/widget/general_information/checkout_genral_infroamtion_card.dart';
import 'package:tollhopper/features/checkout/presentation/widget/order_summary/order_smmary_card.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class CheckoutUi extends StatelessWidget {
  final GestureTapCallback? backButton;
  final String fullName;
  final String licensePateNumber;
  final String time;
  final String date;
  final String address;
  final VoidCallback? checkoutFunction;
  final String totalAmount;
  //final bool isLoading;
  final List<CartModel> cart;
  const CheckoutUi({
    Key? key,
    required this.backButton,
    required this.licensePateNumber,
    required this.fullName,
    required this.time,
    required this.address,
    required this.checkoutFunction,
    required this.date,
    required this.totalAmount,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundCheckoutColor,
        appBar: CommonAppBar(
          title: LocaleKeys.checkout_app_bar_title.tr(),
          hasBackButton: true,
          onTap: backButton,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: Column(
                    children: [
                      CheckoutGeneralInformationCard(
                        fullName: fullName,
                        licensePateNumber: licensePateNumber,
                        date: date,
                        time: time,
                        address: address,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OrderSummaryCard(cart: cart),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CheckoutBottomWidget(
              checkoutFunction: checkoutFunction,
              totalAmount: formatPrice(totalAmount),
            )
          ],
        ),
      ),
    );
  }
}
