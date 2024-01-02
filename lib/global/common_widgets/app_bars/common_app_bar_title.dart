import 'package:flutter/material.dart';

class CommonAppBarTitle extends StatelessWidget {
  final String title;
  const CommonAppBarTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.headline2,
    );
  }
}
