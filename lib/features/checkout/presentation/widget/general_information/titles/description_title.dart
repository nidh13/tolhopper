import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class DescriptionBigTitle extends StatelessWidget {
  final String text;
  const DescriptionBigTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.headline1
          ?.copyWith(color: labelBlackColor, fontSize: 16.65, height: 1),
    );
  }
}
