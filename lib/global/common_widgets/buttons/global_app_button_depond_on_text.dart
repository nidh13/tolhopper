import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class GlobalAppButtonTextWithPadding extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const GlobalAppButtonTextWithPadding(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: appPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            text,
            style: theme.textTheme.headline3?.copyWith(
                color: buttonDarkTextColor, fontSize: 13, height: 1.48),
          ),
        ),
      ),
    );
  }
}
