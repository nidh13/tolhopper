import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class GlobalAppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backGroundColor;
  final Color? textColor;
  final double? height;
  final TextStyle? style;
  const GlobalAppButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.backGroundColor,
      this.height,
      this.style,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 55,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  backGroundColor ?? appPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              elevation: MaterialStateProperty.all(0)),
          child: Text(
            text,
            style: style ??
                theme.textTheme.headline3
                    ?.copyWith(color: textColor ?? buttonDarkTextColor),
          )),
    );
  }
}
