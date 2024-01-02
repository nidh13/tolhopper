import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/display_inforamtion/order_summary_display_information_list_order.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/display_inforamtion/order_summary_display_information_text_bloc_widget.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/display_inforamtion/totale_cose_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryDisplayInformationWidget extends StatelessWidget {
  final String fullName;
  final String pateNumber;
  final String fullAddress;
  final String totalCost;
  final List<CartModel> cart;
  const OrderSummaryDisplayInformationWidget({
    Key? key,
    required this.fullName,
    required this.pateNumber,
    required this.fullAddress,
    required this.totalCost,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: iconWithCircularBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSummaryDisplayInformationTextBloc(
              text: fullName,
              title: LocaleKeys.checkout_name_label.tr(),
            ),
            const SizedBox(
              height: 10,
            ),
            OrderSummaryDisplayInformationTextBloc(
              text: pateNumber,
              title: LocaleKeys.checkout_license_pate_number.tr(),
            ),
            const SizedBox(
              height: 10,
            ),
            OrderSummaryDisplayInformationTextBloc(
              text: fullAddress,
              title: LocaleKeys.contact_information_address_title.tr(),
            ),
            const SizedBox(
              height: 10,
            ),
            OrderSummaryDisplayInformationListOrder(cart: cart),
            const SizedBox(
              height: 15,
            ),
            OrderSummaryTotalCostTextWidget(totalCost: totalCost),
          ],
        ),
      ),
    );
  }
}
