import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  const DescriptionTextWidget({Key? key, required this.text,required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyText1?.copyWith(fontWeight: fontWeight),
    );
  }
}
