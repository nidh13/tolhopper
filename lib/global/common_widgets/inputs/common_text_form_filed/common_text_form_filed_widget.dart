import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CommonTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool? isNotEmail;
  final bool? isPassword;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconHeight;
  final double? prefixIconWidth;
  final VoidCallback? setVisibility;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final FocusNode? focusNode;
  final bool showErrorText;
  const CommonTextForm({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validateData,
    this.onChanged,
    this.isNotEmail,
    this.showErrorText = true,
    this.obscureText = false,
    this.isPassword = false,
    this.readOnly = false,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconHeight,
    this.prefixIconWidth,
    this.onTap,
    this.focusNode,
    this.setVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: showErrorText ? null : 50,
      child: TextFormField(
        style: theme.textTheme.headline5,
        cursorColor: appPrimaryColor,
        decoration: InputDecoration(
          filled: true,
          isDense: showErrorText ? true : null,
          fillColor: globalBackgroundColor, // Background color
          hintText: hint, // Placeholder text
          hintStyle:
              theme.textTheme.headline5?.copyWith(color: homeGerySubTitleColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
              color: globalTextFormFiledBorderColor,
              width: 1,
            ),
          ),
          helperText: showErrorText ? " " : null,
          helperStyle: showErrorText
              ? theme.textTheme.headline5
                  ?.copyWith(color: Colors.transparent, height: 0.5)
              : null,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
                color: globalTextFormFiledBorderColor,
                width: 1), // Border color and width
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
              color: appPrimaryColor,
              width: 1,
            ), // Focus border color and width
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
              color: redErrorLoginInputColor,
              width: 1,
            ), // Error border color and width
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
              color: redErrorLoginInputColor,
              width: 1,
            ), // Error border color and width
          ),
          errorStyle: theme.textTheme.headline5?.copyWith(
              color: redErrorLoginInputColor, height: showErrorText ? 0.5 : 0),
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
          prefixIcon: prefixIcon != null
              ? GlobalSvgIcon(
                  icon: prefixIcon!,
                  height: prefixIconHeight,
                  width: prefixIconWidth,
                  color: prefixIconColor,
                )
              : null,
        ),
        onChanged: onChanged,
        onTap: onTap,
        focusNode: focusNode,
        validator: validateData,
        obscureText: obscureText,
        readOnly: readOnly,
        keyboardType: TextInputType.text,
        controller: controller,
        textCapitalization: isNotEmail == true
            ? TextCapitalization.sentences
            : TextCapitalization.none,
      ),
    );
  }
}
