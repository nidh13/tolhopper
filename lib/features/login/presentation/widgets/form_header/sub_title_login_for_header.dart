import 'package:flutter/material.dart';

class SubTitleLoginFormHeader extends StatelessWidget {
  final String text;
  const SubTitleLoginFormHeader({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.subtitle1,
    );
  }
}
