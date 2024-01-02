import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/form_header/sub_title_login_for_header.dart';
import 'package:tollhopper/features/login/presentation/widgets/form_header/title_login_form_header.dart';

class LoginFormHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const LoginFormHeader({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleLoginFormHeader(title: title),
          SubTitleLoginFormHeader(text: subTitle),
        ],
      ),
    );
  }
}
