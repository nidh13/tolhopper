import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_form_title.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/text_form_login.dart';

class LoginTextFormBloc extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  final bool obscureText;
  final bool? isNotEmail;
  final String title;
  final bool? isPassword;
  final VoidCallback? setVisibility;

  const LoginTextFormBloc({
    Key? key,
    required this.hint,
    required this.controller,
    this.validateData,
    this.isNotEmail,
    this.obscureText = false,
    this.isPassword = false,
    this.setVisibility,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginTextFormTitle(title: title),
          LoginTextForm(
            controller: controller,
            hint: hint,
            validateData: validateData,
            isNotEmail: isNotEmail ?? false,
            obscureText: obscureText,
            isPassword: isPassword,
            setVisibility: setVisibility,
          ),
        ],
      ),
    );
  }
}
