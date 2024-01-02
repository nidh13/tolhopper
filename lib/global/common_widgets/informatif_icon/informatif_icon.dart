import 'package:flutter/material.dart';

class InformativeIcon extends StatelessWidget {
  final String message;
  const InformativeIcon({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,

      child: const Icon(
        Icons.info_outline, // Replace this with your desired icon
      ),
    );
  }
}
