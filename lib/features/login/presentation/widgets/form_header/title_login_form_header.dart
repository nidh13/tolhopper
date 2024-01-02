import 'package:flutter/material.dart';

class TitleLoginFormHeader extends StatelessWidget {
  final String title;
  const TitleLoginFormHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headline1?.copyWith(
        letterSpacing: 0.34,
      ),
    );
  }
}
