import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CommonTextFormTitle extends StatelessWidget {
  final String title;
  const CommonTextFormTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: commonLabelStyle,
      ),
    );
  }
}
