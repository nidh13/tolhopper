import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class CreateAccountBlocWidget extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;
  const CreateAccountBlocWidget(
      {Key? key,
      required this.passwordController,
      required this.repeatPasswordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CommonTextFormBloc(
            controller: passwordController,
            hint: LocaleKeys.register_password_hint.tr(),
            title: LocaleKeys.register_password_title.tr(),
            validateData: FormValidator.validatePassword,
          ),
          CommonTextFormBloc(
            controller: repeatPasswordController,
            hint: LocaleKeys.register_re_password_hint.tr(),
            title: LocaleKeys.contact_information_set_password.tr(),
            validateData: (value) => FormValidator.validateConfirmationPassword(
                current: repeatPasswordController, other: passwordController),
          ),
        ],
      ),
    );
  }
}
