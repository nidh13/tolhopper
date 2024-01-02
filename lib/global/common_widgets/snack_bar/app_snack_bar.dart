import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class AppSnackBar {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: redErrorLoginInputColor,
        content: Text(message),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: selectionGreen,
        content: Text(message),
      ),
    );
  }
}
