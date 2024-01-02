import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class HomeTabHeader extends StatelessWidget {
  final String title;
  const HomeTabHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: theme.textTheme.headline2?.copyWith(color: labelBlackColor),
      ),
    );
  }
}
