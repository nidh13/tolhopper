import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';

class LoadingScreen extends StatelessWidget {
  final double? height;
  final Color? color;
  const LoadingScreen({
    Key? key,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: color ?? blueTextColor,
          size: height ?? 45,
        ),
      ),
    );
    /*
    return SizedBox(
      height: height ?? 55,
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? blueTextColor,
        ),
      ),
    );*/
  }
}
