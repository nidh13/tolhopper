import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/features/login/presentation/widgets/forget_password_button.dart';
import 'package:tollhopper/features/login/presentation/widgets/form_header/login_form_header.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_app_bar/login_app_bar.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_checkbox.dart';
import 'package:tollhopper/features/login/presentation/widgets/registre_button/button_text_with_two_color.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_from_bloc.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class LoginUiScreen extends StatelessWidget {
  final GestureTapCallback? goToRegister;
  final GestureTapCallback? login;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueChanged<bool?>? stayConnected;
  final bool isStayConnected;
  final GestureTapCallback? onTapGoogle;
  final GestureTapCallback? onTapFacebook;
  final VoidCallback? setVisibility;
  final bool obscureText;
  final VoidCallback onSkipPressed;
  final VoidCallback forgetPassword;
  final GlobalKey formKey;
  final bool autoValidate;
  final bool isLoading;
  final bool showSkip;
  const LoginUiScreen({
    Key? key,
    required this.goToRegister,
    required this.emailController,
    required this.passwordController,
    required this.stayConnected,
    required this.isStayConnected,
    this.onTapFacebook,
    required this.formKey,
    required this.autoValidate,
    required this.setVisibility,
    required this.obscureText,
    required this.onSkipPressed,
    required this.forgetPassword,
    required this.login,
    required this.isLoading,
    this.showSkip = true,
    this.onTapGoogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    LoginFormHeader(
                      title: LocaleKeys.login_title.tr(),
                      subTitle: LocaleKeys.register_sub_title.tr(),
                    ),
                    LoginTextFormBloc(
                      controller: emailController,
                      hint: LocaleKeys.register_email_hint.tr(),
                      title: LocaleKeys.register_email_title.tr(),
                      isNotEmail: false,
                      validateData: FormValidator.validateEmail,
                    ),
                    LoginTextFormBloc(
                      controller: passwordController,
                      hint: LocaleKeys.register_password_title.tr(),
                      title: LocaleKeys.register_password_title.tr(),
                      isPassword: true,
                      obscureText: obscureText,
                      setVisibility: setVisibility,
                      validateData: FormValidator.validatePassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: LoginCheckBox(
                            title: LocaleKeys.login_keep_login.tr(),
                            onChanged: stayConnected,
                            isChecked: isStayConnected,
                          ),
                        ),
                        Flexible(
                          child: ForgetPasswordButton(
                            onTap: forgetPassword,
                            title: LocaleKeys.login_forget_password.tr(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    isLoading
                        ? const LoadingScreen()
                        : GlobalAppButton(
                            text: LocaleKeys.login_title.tr(),
                            onPressed: login,
                          ),
                    const SizedBox(
                      height: 25,
                    ),
                    ButtonTextWithTwoColors(
                      text: LocaleKeys.login_dont_have_account.tr(),
                      buttonTitle: LocaleKeys.login_register_here.tr(),
                      onTap: goToRegister,
                    ),
                    // LoginWithSocialMediaWidget(
                    //   onTapFacebook: onTapFacebook,
                    //   onTapGoogle: onTapGoogle,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
