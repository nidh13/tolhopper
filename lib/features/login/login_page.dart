import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/login/presentation/login_screen_ui.dart';
import 'package:tollhopper/global/common_widgets/snack_bar/app_snack_bar.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';

class LoginPage extends StatefulWidget {
  final bool showSkip;
  const LoginPage({
    Key? key,
    this.showSkip = true,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _stayConnected = false;
  bool _obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignInBloc>(),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) async {
          if (state is SignInError) {
            AppSnackBar.showSnackBar(context, state.message);
          } else if (state is SignInSuccess || state is SignInUpSkippedState) {
            goToHome(context);
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return LoginUiScreen(
              emailController: _emailController,
              goToRegister: () => goToRegisterPage(context),
              obscureText: _obscureText,
              isLoading: (state is SignInLoading),
              setVisibility: () => setPasswordVisibility(),
              isStayConnected: _stayConnected,
              passwordController: _passwordController,
              autoValidate: _autoValidate,
              formKey: _loginFormKey,
              stayConnected: (value) => updateStayConnected(value),
              onTapFacebook: () => facebookSigIn(),
              onTapGoogle: () => googleSigIn(),
              onSkipPressed: () => skipLogin(context),
              forgetPassword: () => forgetPassword(context),
              login: () => login(context),
              showSkip: widget.showSkip,
            );
          },
        ),
      ),
    );
  }

  void goToRegisterPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      registerPage,
      arguments: RegisterPageParams(showSkip: widget.showSkip),
    );
  }

  void updateStayConnected(bool? value) {
    setState(() {
      _stayConnected = value ?? _stayConnected;
    });
  }

  void setPasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void googleSigIn() {}

  void facebookSigIn() {}

  void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, homePage, (Route<dynamic> route) => false);
  }

  void forgetPassword(BuildContext context) {
    Navigator.pushNamed(context, resetPassword);
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

  void skipLogin(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(SkipSignInUpEvent());
  }
}
