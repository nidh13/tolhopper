import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/login_pop_up/presentation/login_pop_up_ui.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';

class LoginPopUpPage extends StatefulWidget {
  const LoginPopUpPage({Key? key}) : super(key: key);

  @override
  State<LoginPopUpPage> createState() => _LoginPopUpPageState();
}

class _LoginPopUpPageState extends State<LoginPopUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _stayConnected = false;
  bool obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool userCreated = false;
  bool guessCreated = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInError) {
          handleTooGruError(context: context, signInError: state);
        } else if (state is SignInSuccess) {
          Navigator.pop(context, state.token);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
        return LoginPopUi(
          emailController: _emailController,
          continueAsGuest: () => continueAsGuest(context),
          obscureText: obscureText,
          setVisibility: () => setPasswordVisibility(),
          isStayConnected: _stayConnected,
          passwordController: _passwordController,
          stayConnected: (value) => updateStayConnected(value),
          onTapFacebook: () => facebookSigIn(),
          onTapGoogle: () => googleSigIn(),
          closeFunction: () => closePopUp(context),
          signIn: () => login(context),
          isLoading: (state is SignInLoading),
          formKey: _loginFormKey,
          autoValdiate: _autoValidate,
        );
      }),
    );
  }

  void continueAsGuest(BuildContext context) {
    Navigator.pop(context, "");
  }

  void login(BuildContext context) {
    setState(() {
      _autoValidate = true;
    });
    if (_loginFormKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;
      BlocProvider.of<SignInBloc>(context).add(SignInWithCredEvent(
          email: email, password: password, stayLogin: _stayConnected));
    }
  }

  void updateStayConnected(bool? value) {
    setState(() {
      _stayConnected = value ?? _stayConnected;
    });
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void googleSigIn() {}

  void facebookSigIn() {}

  void closePopUp(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> handleTooGruError(
      {required SignInError signInError, required BuildContext context}) async {
    if (signInError.isInternetFailure) {
      final result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
      if (result) {
        login(context);
      }
    } else if (signInError.isCredentialFailure) {
      await DialogUtils.showOKDialog(
          context: context,
          title: LocaleKeys.login_pop_up_wrong_credential_title.tr(),
          confirmButtonText:
              LocaleKeys.login_pop_up_wrong_credential_confirm_button.tr(),
          content: signInError.message);
    } else {
      final result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
      if (result) {
        login(context);
      }
    }
  }
}
