import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class UserProfileFormHeader extends StatelessWidget {
  final String text;
  const UserProfileFormHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: theme.textTheme.headline2?.copyWith(
            color: geryTextLoginInputColor, fontSize: 16, height: 1.18),
      ),
    );
  }
}
