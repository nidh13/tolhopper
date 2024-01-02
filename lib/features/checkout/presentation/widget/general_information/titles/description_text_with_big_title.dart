import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class DescriptionSmallTitle extends StatelessWidget {
  final String text;
  const DescriptionSmallTitle({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.headline3?.copyWith(
          color: descriptionTextSmallTitleColor, fontSize: 10.28, height: 1.23),
    );
  }
}
