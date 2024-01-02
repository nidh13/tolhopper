import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class VignetteDisplayText extends StatelessWidget {
  final String value;
  const VignetteDisplayText({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: globalTextFormFiledBorderColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              value,
              style: theme.textTheme.headline2?.copyWith(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
