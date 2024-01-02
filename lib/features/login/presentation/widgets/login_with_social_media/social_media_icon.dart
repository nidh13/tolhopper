import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tollhopper/global/theme/themes.dart';

class SocialMediaIcon extends StatelessWidget {
  final String icon;
  final GestureTapCallback? onTap;
  const SocialMediaIcon({Key? key, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 95,
        decoration: BoxDecoration(
          border: Border.all(
            color: geryHintLoginInputColor,
            width: 0.7,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
