import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tollhopper/global/theme/themes.dart';

class SvgIconWithRoundBackground extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final bool hasBorder;
  final bool forVehicule;
  final double? iconPadding;
  const SvgIconWithRoundBackground(
      {Key? key,
      required this.icon,
      this.color,
      this.width,
      this.height,
      this.iconPadding,
      this.hasBorder = false,
      this.forVehicule = false,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? iconWithCircularBackgroundColor,
        border: forVehicule
            ? Border.all(
                color: hasBorder
                    ? globalTextFormFiledBorderColor
                    : Colors.transparent,
                width: 1.0,
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(iconPadding ?? 10.0),
        child: SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
