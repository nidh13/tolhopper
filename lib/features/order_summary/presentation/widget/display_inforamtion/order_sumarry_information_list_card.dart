import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/display_inforamtion/order_summary_display_information_text_bloc_widget.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryInformationListCard extends StatelessWidget {
  final String packageName;
  final String additionalFee;
  final String subTotal;
  const OrderSummaryInformationListCard(
      {Key? key,
      required this.additionalFee,
      required this.packageName,
      required this.subTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummaryDisplayInformationTextBloc(
          title: LocaleKeys.checkout_package.tr(),
          text: packageName,
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        // OrderSummaryDisplayInformationTextBloc(
        //   title: LocaleKeys.checkout_additional_fee.tr(),
        //   text: additionalFee,
        // ),
        const SizedBox(
          height: 5,
        ),
        OrderSummaryDisplayInformationTextBloc(
          title: LocaleKeys.checkout_sub_total.tr(),
          text: subTotal,
        ),
      ],
    );
  }
}
