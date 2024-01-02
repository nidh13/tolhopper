import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class AppSeparatorWidget extends StatelessWidget {
  const AppSeparatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: trajectoryCardBorderColor,
      height: 1,
    );
  }
}
