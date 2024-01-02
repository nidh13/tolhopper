import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/theme/themes.dart';

class SplashScreenUi extends StatelessWidget {
  final AnimationController controller;
  final void Function() whenComplete;

  const SplashScreenUi({
    Key? key,
    required this.controller,
    required this.whenComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalBackgroundColor,
      body: Center(
        child: Lottie.asset(
          splashLottieZip,
          width: context.width * .85,
          frameRate: FrameRate.max,
          fit: BoxFit.contain,
          controller: controller,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward().whenComplete(whenComplete);
          },
        ),
      ),
    );
  }
}
