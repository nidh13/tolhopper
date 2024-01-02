import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/features/login/presentation/widgets/form_header/login_form_header.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_app_bar/login_app_bar.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_checkbox.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_from_bloc.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/registre/presentation/widgets/gender_bloc.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class RegisterPageUi extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final TextEditingController emailController;
  final TextEditingController confirmEmailController;
  final ValueChanged<bool?>? acceptTerms;
  final bool acceptTermsValue;
  final bool obscurePassword;
  final VoidCallback setVisibilityPassword;
  final VoidCallback setVisibilityRePassword;
  final bool obscurerEPassword;
  final UserGender? userGender;
  final Function changeGender;
  final GlobalKey formKey;
  final VoidCallback? register;
  final bool autoValidate;
  final bool isLoading;
  final VoidCallback onSkipPressed;
  final GestureTapCallback? onTapCheckboxText;
  final bool showSkip;

  const RegisterPageUi({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.emailController,
    required this.confirmEmailController,
    required this.rePasswordController,
    required this.acceptTerms,
    required this.userGender,
    required this.acceptTermsValue,
    required this.changeGender,
    required this.obscurePassword,
    required this.formKey,
    required this.setVisibilityPassword,
    required this.setVisibilityRePassword,
    required this.obscurerEPassword,
    required this.onSkipPressed,
    required this.register,
    required this.autoValidate,
    required this.onTapCheckboxText,
    required this.isLoading,
    required this.showSkip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: LoginAppBar(
          onSkipPressed: onSkipPressed,
          showSkip: showSkip,
        ),
        body: Form(
          key: formKey,
          autovalidateMode: autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginFormHeader(
                    title: LocaleKeys.register_title.tr(),
                    subTitle: LocaleKeys.register_sub_title.tr(),
                  ),
                  GenderBloc(
                    autoVal: autoValidate,
                    gender: userGender,
                    changeGender: changeGender,
                    title: LocaleKeys.register_gender_title.tr(),
                    validateData: FormValidator.validateGender,
                  ),
                  LoginTextFormBloc(
                    controller: firstNameController,
                    hint: LocaleKeys.register_first_name_hint.tr(),
                    title: LocaleKeys.register_first_name_title.tr(),
                    isNotEmail: true,
                    validateData: FormValidator.validateRequiredFields,
                  ),
                  LoginTextFormBloc(
                    controller: lastNameController,
                    hint: LocaleKeys.register_last_name_hint.tr(),
                    title: LocaleKeys.register_last_name_title.tr(),
                    isNotEmail: true,
                    validateData: FormValidator.validateRequiredFields,
                  ),
                  LoginTextFormBloc(
                    controller: emailController,
                    hint: LocaleKeys.register_email_hint.tr(),
                    title: LocaleKeys.register_email_title.tr(),
                    isNotEmail: false,
                    validateData: FormValidator.validateEmail,
                  ),
                  LoginTextFormBloc(
                    controller: confirmEmailController,
                    hint: LocaleKeys.register_re_email_hint.tr(),
                    title: LocaleKeys.register_re_email_title.tr(),
                    isNotEmail: false,
                    validateData: (value) =>
                        FormValidator.validateConfirmationEmail(
                      current: confirmEmailController,
                      other: emailController,
                    ),
                  ),
                  LoginTextFormBloc(
                    controller: passwordController,
                    hint: LocaleKeys.register_password_hint.tr(),
                    title: LocaleKeys.register_password_title.tr(),
                    isNotEmail: true,
                    isPassword: true,
                    obscureText: obscurePassword,
                    setVisibility: setVisibilityPassword,
                    validateData: FormValidator.validatePassword,
                  ),
                  LoginTextFormBloc(
                    controller: rePasswordController,
                    isPassword: true,
                    hint: LocaleKeys.register_re_password_hint.tr(),
                    title: LocaleKeys.register_re_password_title.tr(),
                    isNotEmail: true,
                    obscureText: obscurerEPassword,
                    setVisibility: setVisibilityRePassword,
                    validateData: (value) =>
                        FormValidator.validateConfirmationPassword(
                            current: rePasswordController,
                            other: passwordController),
                  ),
                  LoginCheckBox(
                    title: LocaleKeys.register_checkbox_text.tr(),
                    onChanged: acceptTerms,
                    isChecked: acceptTermsValue,
                    textColor: checkBoxTextColor,
                    validate: autoValidate ? acceptTermsValue : true,
                    onTapCheckboxText: onTapCheckboxText,
                    underLineText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  isLoading
                      ? const LoadingScreen()
                      : GlobalAppButton(
                          text: LocaleKeys.register_button_text.tr(),
                          onPressed: register,
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
