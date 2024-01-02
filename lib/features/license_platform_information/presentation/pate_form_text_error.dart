import 'package:flutter/material.dart';

class PateFormTextError extends StatelessWidget {
  final String text;
  final Color color;
  const PateFormTextError({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.headline5?.copyWith(color: color, height: 0.5),
    );
  }
}
