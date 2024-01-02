import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CommonTextWithIcon extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final String title;
  final Color? titleColor;
  final double? fontSize;
  final double? height;
  const CommonTextWithIcon(
      {Key? key,
      required this.icon,
      required this.title,
      this.height,
      this.iconColor,
      this.fontSize,
      this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlobalSvgIcon(
          icon: icon,
          color: iconColor ?? appPrimaryColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          title,
          style: cartTitleStyle.copyWith(
              color: selectedIconColor,
              fontSize: fontSize ?? 16,
              height: height ?? 1.18),
        ),
      ],
    );
  }
}
