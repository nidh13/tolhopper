import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class TollSelectionTextWithIcon extends StatelessWidget {
  final String icon;
  final String title;
  const TollSelectionTextWithIcon(
      {Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalSvgIcon(
          icon: icon,
          height: 20,
          width: 20,
          color: blueTextColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
            style: cartTitleStyle,
          ),
        ),
      ],
    );
  }
}
