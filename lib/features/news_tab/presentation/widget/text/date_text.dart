import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class NewsDateText extends StatelessWidget {
  final String text;
  const NewsDateText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.headline4
          ?.copyWith(color: newsGreyText, height: 1.19, letterSpacing: null),
    );
  }
}
