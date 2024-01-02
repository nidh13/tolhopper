import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/reset_password/presentation/reset_password_ui.dart';
import 'package:tollhopper/global/common_widgets/snack_bar/app_snack_bar.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:tollhopper/core/services/injection_container.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _resetPasswordFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is ResetPasswordEmailSendState) {
            AppSnackBar.showSuccessSnackBar(
                context, LocaleKeys.reset_password_success_message.tr());
          } else if (state is SignInError) {
            AppSnackBar.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return ResetPasswordUi(
            backButton: () => backButton(context),
            isLoading: (state is SignInLoading),
            emailController: _emailController,
            formKey: _resetPasswordFormKey,
            autoValdiate: _autoValidate,
            sendEmail: () =>
                sendEmail(context: context, email: _emailController.text),
          );
        },
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void sendEmail({required String email, required BuildContext context}) {
    setState(() {
      _autoValidate = true;
    });
    if (_resetPasswordFormKey.currentState?.validate() ?? false) {
      BlocProvider.of<SignInBloc>(context).add(RestPasswordEvent(
          email: email, languageCode: getLocaleLanguageCode(context)));
    }
  }
}
