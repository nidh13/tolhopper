import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/date_picker/common_date_picker.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_title.dart';

class CommonDatePickerBloc extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String title;
  final FormFieldValidator<String>? validateData;
  const CommonDatePickerBloc(
      {Key? key,
      required this.hint,
      required this.controller,
      this.validateData,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormTitle(title: title),
          CommonDatePicker(
            hint: hint,
            controller: controller,
            validateData: validateData,
          ),
        ],
      ),
    );
  }
}
