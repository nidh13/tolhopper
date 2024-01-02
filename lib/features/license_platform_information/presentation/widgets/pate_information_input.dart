import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class PateInformationInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  final int? maxLength;
  final void Function(String)? onChanged;

  const PateInformationInput({
    Key? key,
    required this.hint,
    this.validateData,
    required this.controller,
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.headline2,
      textCapitalization: TextCapitalization.characters,
      maxLength: maxLength,
      cursorColor: appPrimaryColor,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        counterText: "",
        fillColor: geryPateInputColor,
        // Background color
        hintText: hint,
        // Placeholder text
        hintStyle: theme.textTheme.headline2?.copyWith(
          color: checkBoxTextColor,
          fontSize: 18,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
              color: globalTextFormFiledBorderColor,
              width: 1), // Border color and width
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
              color: globalTextFormFiledBorderColor,
              width: 1), // Border color and width
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
              color: appPrimaryColor, width: 1), // Focus border color and width
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
              color: redErrorLoginInputColor,
              width: 1), // Error border color and width
        ),
        errorStyle:
            theme.textTheme.headline5?.copyWith(color: redErrorLoginInputColor),
      ),
      validator: validateData,
      keyboardType: TextInputType.text,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
