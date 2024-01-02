import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/texts/headline4_text_widget.dart';

class ForgetPasswordButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const ForgetPasswordButton(
      {Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Headline4TextWidget(
        title: title,
      ),
    );
  }
}
