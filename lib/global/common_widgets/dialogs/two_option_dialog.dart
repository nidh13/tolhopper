import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class AppTwoOptionDialog extends StatelessWidget {
  final String content;
  final String confirmButtonText;
  final String disableButtonText;
  const AppTwoOptionDialog(
      {Key? key,
      required this.content,
      required this.confirmButtonText,
      required this.disableButtonText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoAlertDialog(
      content: Text(
        content,
        style: theme.textTheme.headline4,
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          textStyle: theme.textTheme.headline3?.copyWith(color: blueTextColor),
          onPressed: () => Navigator.pop(context, false),
          child: Text(disableButtonText),
        ),
        CupertinoDialogAction(
          textStyle: theme.textTheme.headline3?.copyWith(color: blueTextColor),
          onPressed: () => Navigator.pop(context, true),
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
