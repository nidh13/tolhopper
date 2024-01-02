import 'package:flutter/material.dart';

class AppPngIcon extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  const AppPngIcon({Key? key, required this.path, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: width,
    );
  }
}
