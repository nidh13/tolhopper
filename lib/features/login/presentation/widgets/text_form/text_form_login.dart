import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class LoginTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  final bool obscureText;
  final bool isNotEmail;
  final bool? isPassword;
  final VoidCallback? setVisibility;

  const LoginTextForm({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validateData,
    this.isNotEmail = true,
    this.obscureText = false,
    this.isPassword = false,
    this.setVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.headline5,
      cursorColor: appPrimaryColor,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: geryInputLoginBackGroundColor,
        // Background color
        hintText: hint,
        // Placeholder text
        hintStyle:
            theme.textTheme.headline5?.copyWith(color: geryHintLoginInputColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: geryInputLoginBorderColor,
              width: 1), // Border color and width
        ),
        helperText: " ",
        helperStyle: theme.textTheme.headline5
            ?.copyWith(color: Colors.transparent, height: 0.5),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: geryInputLoginBorderColor,
              width: 1), // Border color and width
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: appPrimaryColor, width: 1), // Focus border color and width
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: redErrorLoginInputColor,
              width: 1), // Error border color and width
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: redErrorLoginInputColor,
              width: 1), // Error border color and width
        ),
        errorStyle: theme.textTheme.headline5
            ?.copyWith(color: redErrorLoginInputColor, height: 0.5),
        suffixIcon: isPassword == true
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                ),
                color: theme.highlightColor,
                onPressed: setVisibility,
              )
            : null,
      ),
      validator: validateData,
      obscureText: obscureText,
      keyboardType:
          isNotEmail ? TextInputType.text : TextInputType.emailAddress,
      controller: controller,
      textCapitalization: isNotEmail == true
          ? TextCapitalization.sentences
          : TextCapitalization.none,
    );
  }
}
