import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_from_bloc.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class ResetPasswordUi extends StatelessWidget {
  final GestureTapCallback? backButton;
  final TextEditingController emailController;
  final bool isLoading;
  final VoidCallback? sendEmail;
  final GlobalKey formKey;
  final bool autoValdiate;
  const ResetPasswordUi(
      {Key? key,
      required this.backButton,
      required this.emailController,
      required this.isLoading,
      required this.sendEmail,
      required this.formKey,
      required this.autoValdiate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.reset_password_app_bar_title.tr(),
          hasBackButton: true,
          onTap: backButton,
        ),
        body: Form(
          key: formKey,
          autovalidateMode: autoValdiate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                LoginTextFormBloc(
                  controller: emailController,
                  hint: LocaleKeys.reset_password_hint.tr(),
                  title: LocaleKeys.register_email_title.tr(),
                  isNotEmail: false,
                  validateData: FormValidator.validateEmail,
                ),
                const SizedBox(
                  height: 5,
                ),
                isLoading
                    ? const LoadingScreen()
                    : GlobalAppButton(
                        text: LocaleKeys.reset_password_send.tr(),
                        onPressed: sendEmail,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
