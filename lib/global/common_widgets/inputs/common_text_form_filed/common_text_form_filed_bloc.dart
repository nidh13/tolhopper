import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_title.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_widget.dart';

class CommonTextFormBloc extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool? isNotEmail;
  final String title;
  final bool? isPassword;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconHeight;
  final double? prefixIconWidth;
  final VoidCallback? setVisibility;
  final FocusNode? focusNode;
  final bool hasPaddingBottom;
  final bool showErrorText;
  final GestureTapCallback? onTap;
  final bool readOnly;
  const CommonTextFormBloc({
    Key? key,
    required this.hint,
    required this.controller,
    this.validateData,
    this.onChanged,
    this.isNotEmail,
    this.obscureText = false,
    this.isPassword = false,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconHeight,
    this.prefixIconWidth,
    this.setVisibility,
    required this.title,
    this.showErrorText = true,
    this.hasPaddingBottom = true,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: hasPaddingBottom ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormTitle(title: title),
          CommonTextForm(
            controller: controller,
            hint: hint,
            onChanged: onChanged,
            onTap: onTap,
            validateData: validateData,
            isNotEmail: isNotEmail,
            obscureText: obscureText,
            isPassword: isPassword,
            setVisibility: setVisibility,
            prefixIconWidth: prefixIconWidth,
            prefixIconHeight: prefixIconHeight,
            prefixIconColor: prefixIconColor,
            prefixIcon: prefixIcon,
            focusNode: focusNode,
            showErrorText: showErrorText,
            readOnly: readOnly,
          ),
        ],
      ),
    );
  }
}
