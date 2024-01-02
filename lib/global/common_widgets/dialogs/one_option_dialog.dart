import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class AppOneOptionDialog extends StatelessWidget {
  final String content;
  final String title;
  final String confirmButtonText;
  const AppOneOptionDialog(
      {Key? key,
      required this.content,
      required this.confirmButtonText,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoAlertDialog(
      content: Text(
        content,
        style: theme.textTheme.headline4,
      ),
      title: Text(
        title,
        style: theme.textTheme.headline1,
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          textStyle: theme.textTheme.headline3?.copyWith(color: blueTextColor),
          onPressed: () => Navigator.pop(context),
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
