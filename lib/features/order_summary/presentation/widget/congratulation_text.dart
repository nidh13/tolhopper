import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CongratulationText extends StatelessWidget {
  final String title;
  final String subTitle;
  const CongratulationText(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: theme.textTheme.headline1?.copyWith(
              color: orderSummaryItemTitleColor, fontSize: 16, height: 1.87),
        ),
        Text(
          subTitle,
          style: theme.textTheme.subtitle1?.copyWith(
              color: descriptionTextSmallTitleColor,
              height: 1.8,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
