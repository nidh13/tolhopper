import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/registre/presentation/registre_ui.dart';
import 'package:tollhopper/global/common_widgets/snack_bar/app_snack_bar.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  final bool showSkip;

  const RegisterPage({
    Key? key,
    this.showSkip = true,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  bool _acceptTermsValue = false;
  UserGender? _userGender;
  bool _obscurePassword = true;
  bool _obscureRePassword = true;
  final _registerFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _confirmEmailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
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
          } else if (state is SignUpSuccess) {
            _backToLogin(context);
          } else if (state is SignInUpSkippedState) {
            goToHome(context);
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) => RegisterPageUi(
            passwordController: _passwordController,
            emailController: _emailController,
            confirmEmailController: _confirmEmailController,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            rePasswordController: _rePasswordController,
            acceptTerms: updateStayAcceptTerms,
            acceptTermsValue: _acceptTermsValue,
            userGender: _userGender,
            changeGender: _changeGender,
            obscurePassword: _obscurePassword,
            obscurerEPassword: _obscureRePassword,
            setVisibilityPassword: () => _changeObscurePassword(),
            setVisibilityRePassword: () => _changeObscureRePassword(),
            formKey: _registerFormKey,
            register: () => _register(context),
            autoValidate: _autoValidate,
            isLoading: (state is SignInLoading),
            onSkipPressed: () => skipRegister(context),
            onTapCheckboxText: () =>
                lunchUrlTerms(context, LaunchMode.externalApplication),
            showSkip: widget.showSkip,
          ),
        ),
      ),
    );
  }

  void updateStayAcceptTerms(bool? value) {
    setState(() {
      _acceptTermsValue = value ?? _acceptTermsValue;
    });
  }

  void _changeGender(UserGender? userGender) {
    setState(() {
      _userGender = userGender ?? UserGender.female;
    });
  }

  void _changeObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _changeObscureRePassword() {
    setState(() {
      _obscureRePassword = !_obscureRePassword;
    });
  }

  void _backToLogin(BuildContext context) {
    AppSnackBar.showSuccessSnackBar(
        context, LocaleKeys.register_success_message.tr());
    Navigator.of(context).pop();
  }

  void _register(BuildContext context) {
    setState(() {
      _autoValidate = true;
    });
    if (_acceptTermsValue == true &&
        (_registerFormKey.currentState?.validate() ?? false)) {
      BlocProvider.of<SignInBloc>(context).add(
        SignUpWithCredEvent(
            password: _passwordController.text,
            email: _emailController.text,
            firstName: _firstNameController.text,
            gender: _userGender!.toDataBase,
            countryCode: getLocaleLanguageCode(context),
            lastName: _lastNameController.text,
            guest: false),
      );
    }
  }

  void skipRegister(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(SkipSignInUpEvent());
  }

  void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, homePage, (Route<dynamic> route) => false);
  }
}
