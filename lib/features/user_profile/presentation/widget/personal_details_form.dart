import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/registre/presentation/widgets/gender_bloc.dart';
import 'package:tollhopper/features/user_profile/presentation/widget/user_profile_form_header.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class PersonalDetails extends StatelessWidget {
  final GestureTapCallback? backButton;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final UserGender? userGender;
  final Function changeGender;
  const PersonalDetails(
      {Key? key,
      required this.changeGender,
      required this.userGender,
      required this.emailController,
      required this.lastNameController,
      required this.backButton,
      required this.firstNameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfileFormHeader(
          text: LocaleKeys.personal_settings_personal_details.tr(),
        ),
        GenderBloc(
          autoVal: true,
          gender: userGender,
          hasNotBackground: true,
          changeGender: changeGender,
          title: LocaleKeys.register_gender_title.tr(),
        ),
        CommonTextFormBloc(
          controller: firstNameController,
          hint: LocaleKeys.register_first_name_hint.tr(),
          title: LocaleKeys.register_first_name_title.tr(),
          isNotEmail: false,
        ),
        CommonTextFormBloc(
          controller: lastNameController,
          hint: LocaleKeys.register_last_name_hint.tr(),
          title: LocaleKeys.register_last_name_title.tr(),
          isNotEmail: false,
        ),
        CommonTextFormBloc(
          controller: emailController,
          hint: LocaleKeys.register_email_hint.tr(),
          title: LocaleKeys.register_email_title.tr(),
          isNotEmail: false,
          readOnly: true,
        ),
      ],
    );
  }
}
