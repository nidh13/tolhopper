import 'package:flutter/material.dart';

class RichTextContent extends StatelessWidget {
  final String title;
  final List<InlineSpan>? children;
  final TextStyle? style;

  const RichTextContent({
    Key? key,
    this.children,
    this.style,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: title,
        style: style ?? theme.textTheme.headline3,
        children: children,
      ),
    );
  }
}
