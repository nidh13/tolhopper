import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconWithAction extends StatelessWidget {
  final String icon;
  final GestureTapCallback? onTap;
  final Color? color;
  final double? height;
  final double? width;
  const SvgIconWithAction(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.color,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
