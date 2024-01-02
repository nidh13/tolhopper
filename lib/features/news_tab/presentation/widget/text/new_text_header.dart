import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class NewsTextHeader extends StatelessWidget {
  final String title;
  const NewsTextHeader({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headline4?.copyWith(
          color: newsGreyText,
          height: 1.19,
          letterSpacing: null),
    );
  }
}
