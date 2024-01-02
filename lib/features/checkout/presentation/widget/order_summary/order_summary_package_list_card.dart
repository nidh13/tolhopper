import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/checkout/presentation/widget/order_summary/order_summary_description_text.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryPackageListCard extends StatelessWidget {
  final String packageName;
  final String title;
  final String additionalFee;
  final String subTotal;
  final String startDate;
  final String endDate;
  const OrderSummaryPackageListCard({
    Key? key,
    required this.additionalFee,
    required this.packageName,
    required this.subTotal,
    required this.startDate,
    required this.endDate,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          OrderSummaryDescriptionText(
            title: packageName,
            text: title,
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          // OrderSummaryDescriptionText(
          //   title: LocaleKeys.checkout_additional_fee.tr(),
          //   text: additionalFee,
          // ),
          const SizedBox(
            height: 8,
          ),
          OrderSummaryDescriptionText(
            title: LocaleKeys.checkout_sub_total.tr(),
            text: subTotal,
          ),
          const SizedBox(
            height: 8,
          ),
          OrderSummaryDescriptionText(
            title: LocaleKeys.calculator_tab_start_date.tr(),
            text: startDate,
          ),
          const SizedBox(
            height: 8,
          ),
          OrderSummaryDescriptionText(
            title: LocaleKeys.calculator_tab_end_date.tr(),
            text: endDate,
          ),
        ],
      ),
    );
  }
}
