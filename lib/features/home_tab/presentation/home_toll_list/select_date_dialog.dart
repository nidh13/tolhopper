import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/date_picker/common_date_picker_bloc.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class SelectDateDialog extends StatefulWidget {
  const SelectDateDialog({Key? key}) : super(key: key);

  @override
  State<SelectDateDialog> createState() => _SelectDateDialogState();
}

class _SelectDateDialogState extends State<SelectDateDialog> {
  TextEditingController startDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: globalBackgroundColor,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: globalBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonDatePickerBloc(
                  controller: startDateController,
                  hint: LocaleKeys.calculator_tab_select_date_hint.tr(),
                  title: LocaleKeys.calculator_tab_start_date.tr(),
                  validateData:
                      FormValidator.validateRequiredFieldsWithoutMessage,
                ),
                GlobalAppButton(
                  text: LocaleKeys.choose.tr(),
                  onPressed: () => chose(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chose() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop(startDateController.text);
    }
  }
}
