import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/features/login/presentation/widgets/form_header/login_form_header.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_checkbox.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_from_bloc.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/app_bars/svg_icon_with_action.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class LoginPopUi extends StatelessWidget {
  final GestureTapCallback? continueAsGuest;
  final GestureTapCallback? signIn;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueChanged<bool?>? stayConnected;
  final bool isStayConnected;
  final GestureTapCallback? onTapGoogle;
  final GestureTapCallback? onTapFacebook;
  final VoidCallback? setVisibility;
  final bool obscureText;
  final GestureTapCallback? closeFunction;
  final GlobalKey formKey;
  final bool autoValdiate;
  final bool isLoading;
  const LoginPopUi(
      {Key? key,
      required this.continueAsGuest,
      required this.emailController,
      required this.passwordController,
      required this.stayConnected,
      required this.isStayConnected,
      this.onTapFacebook,
      required this.setVisibility,
      required this.obscureText,
      this.onTapGoogle,
      required this.signIn,
      required this.closeFunction,
      required this.isLoading,
      required this.formKey,
      required this.autoValdiate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(15.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
      child: SizedBox(
        height: height * 0.75,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: autoValdiate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: LoginFormHeader(
                          title: LocaleKeys.login_title.tr(),
                          subTitle: LocaleKeys.register_sub_title.tr(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SvgIconWithAction(
                            icon: closeCircle, onTap: closeFunction),
                      )
                    ],
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
                      SizedBox(
                        width: 120,
                        child: isLoading
                            ? const LoadingScreen()
                            : GlobalAppButton(
                                text: LocaleKeys.login_title.tr(),
                                height: 40,
                                onPressed: signIn,
                              ),
                      ),
                    ],
                  ),
                  // LoginWithSocialMediaWidget(
                  //   onTapFacebook: onTapFacebook,
                  //   onTapGoogle: onTapGoogle,
                  //   paddingTop: 25,
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  GlobalAppButton(
                    text: LocaleKeys.login_continue_as_guest.tr(),
                    onPressed: continueAsGuest,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
