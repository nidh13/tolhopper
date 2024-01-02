import 'package:flutter/material.dart';

class LoginTextFormTitle extends StatelessWidget {
  final String title;
  const LoginTextFormTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: theme.textTheme.headline3,
      ),
    );
  }
}
