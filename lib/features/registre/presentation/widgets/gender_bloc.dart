import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_form_title.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/registre/presentation/widgets/gender_select_option.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_title.dart';

class GenderBloc extends StatelessWidget {
  final UserGender? gender;
  final Function changeGender;
  final bool autoVal;
  final String title;
  final bool hasNotBackground;
  final FormFieldValidator<UserGender>? validateData;
  const GenderBloc(
      {Key? key,
      required this.changeGender,
      required this.gender,
      required this.autoVal,
      this.hasNotBackground = false,
      required this.title,
        this.validateData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasNotBackground
              ? CommonTextFormTitle(title: title)
              : LoginTextFormTitle(title: title),
          GenderSelectOption(
            changeGender: changeGender,
            gender: gender,
            hasBackground: hasNotBackground,
            validateData: validateData,
          ),
        ],
      ),
    );
  }
}
