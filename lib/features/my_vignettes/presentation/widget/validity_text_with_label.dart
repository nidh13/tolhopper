import 'package:flutter/material.dart';

class ValidityTextWithLabel extends StatelessWidget {
  final String label;
  final String title;
  const ValidityTextWithLabel(
      {Key? key, required this.title, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          label + ": ",
          style: theme.textTheme.subtitle2,
        ),
        Text(
          title,
          style: theme.textTheme.subtitle2,
        ),
      ],
    );
  }
}
