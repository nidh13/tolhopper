import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class TwoOptionDialogWithIcon extends StatelessWidget {
  final String text;
  final String confirmButtonText;
  final String disableButtonText;
  final String title;
  final IconData icon;

  const TwoOptionDialogWithIcon(
      {Key? key,
      required this.text,
      required this.confirmButtonText,
      required this.disableButtonText,
      required this.title,
      required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoAlertDialog(
      title: Column(
        children: [
          Icon(
            icon,
            color: blackAppBarTextColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: theme.textTheme.headline2,
          ),
        ],
      ),
      content: Text(
        text,
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
