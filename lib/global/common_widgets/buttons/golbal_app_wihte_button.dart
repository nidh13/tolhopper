import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class GlobalAppWhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const GlobalAppWhiteButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(globalBackgroundColor),
            elevation: MaterialStateProperty.all(0.0),
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                color: appPrimaryColor,
                width: 0.96,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          child: Text(
            text,
            style:
                theme.textTheme.headline3?.copyWith(color: buttonDarkTextColor),
          )),
    );
  }
}
