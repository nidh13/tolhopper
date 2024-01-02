import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class Headline4TextWidget extends StatelessWidget {
  final String title;
  final Color? textColor;
  final bool underLineText;
  const Headline4TextWidget(
      {Key? key,
      required this.title,
      this.textColor,
      this.underLineText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headline4?.copyWith(
          color: underLineText ? blueTextColor : textColor,
          decoration: underLineText ? TextDecoration.underline : null,
          decorationColor: underLineText ? blueTextColor : null),
    );
  }
}
