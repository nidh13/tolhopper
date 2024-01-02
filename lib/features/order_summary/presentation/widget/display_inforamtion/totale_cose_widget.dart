import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryTotalCostTextWidget extends StatelessWidget {
  final String totalCost;
  const OrderSummaryTotalCostTextWidget({Key? key, required this.totalCost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.checkout_total_amount.tr(),
          style: theme.textTheme.bodyText2?.copyWith(
              height: 1, fontSize: 12.95, fontWeight: FontWeight.w600),
        ),
        Text(
          totalCost,
          style: theme.textTheme.headline1
              ?.copyWith(color: blueTextColor, fontSize: 16, height: 1.22),
        ),
      ],
    );
  }
}
