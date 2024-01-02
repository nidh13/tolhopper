import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/congratulation_widget.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/display_inforamtion/order_summary_display_information_widget.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryUi extends StatelessWidget {
  final String fullName;
  final String pateNumber;
  final String fullAddress;
  final String totalCost;
  final VoidCallback? backToHome;
  final List<CartModel> cart;

  const OrderSummaryUi({
    Key? key,
    required this.totalCost,
    required this.fullAddress,
    required this.pateNumber,
    required this.fullName,
    required this.backToHome,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: globalBackgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: CommonAppBar(
            title: LocaleKeys.order_summary_app_bar_title.tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        const AppCongratulationWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                        OrderSummaryDisplayInformationWidget(
                          fullName: fullName,
                          fullAddress: fullAddress,
                          pateNumber: pateNumber,
                          totalCost: totalCost,
                          cart: cart,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )),
                GlobalAppButton(
                  text: LocaleKeys.order_summary_back_to_home.tr(),
                  onPressed: backToHome,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
