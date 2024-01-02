import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class OrderSummaryDescriptionText extends StatelessWidget {
  final String title;
  final String text;
  const OrderSummaryDescriptionText(
      {Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.headline2?.copyWith(
            color: orderSummaryItemTitleColor,
            fontSize: 13.11,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: theme.textTheme.headline3?.copyWith(
            color: orderSummaryItemTextColor,
            height: 1.22,
            fontSize: 13.11,
          ),
        )
      ],
    );
  }
}
