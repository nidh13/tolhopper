import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalSvgIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  const GlobalSvgIcon(
      {Key? key, required this.icon, this.color, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: SvgPicture.asset(
          icon,
          color: color,
        ),
      ),
    );
  }
}
