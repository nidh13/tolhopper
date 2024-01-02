import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tollhopper/global/assets/icons.dart';

class SplashScreenLogo extends StatelessWidget {
  const SplashScreenLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: SvgPicture.asset(
        splashScreenLogo,
      ),
    );
  }
}
