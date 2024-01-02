import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/contract_information/presentation/contract_information_ui.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';

class ContactInformation extends StatefulWidget {
  final bool isConnected;
  final String token;
  final String licencePate;
  final String licencePateRegEx;
  final String countryLicencePate;

  const ContactInformation({
    Key? key,
    required this.isConnected,
    required this.token,
    required this.licencePate,
    required this.countryLicencePate,
    required this.licencePateRegEx,
  }) : super(key: key);

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _countryNameTextEditingController =
      TextEditingController();
  final TextEditingController _companyNameTextEditingController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  bool requestAnInvoice = false;
  bool createAccount = false;
  UserGender? _userGender;

  UserModel? _userModel;
  bool hasGuest = false;
  bool userCreated = false;
  bool _isConnected = false;

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isConnected = widget.isConnected;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    _countryNameTextEditingController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _houseNumberController.dispose();
    _postalCodeController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    _companyNameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: widget.isConnected
              ? (context) =>
                  sl<SignInBloc>()..add(GetUserByIdEvent(token: widget.token))
              : (context) => sl<SignInBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) async {
              if (state is UserLoadedState) {
                updateUser(state.userModel);
                updateFields(state.userModel);
              } else if (state is SignUpSuccess) {
                updateStatus(userModel: state.usersModel);
                proceedToCheckout();
              } else if (state is UserUpdatedState) {
                updateUser(state.userModel);
                proceedToCheckout();
              } else if (state is SignInError) {
                handleSignUpError(signInError: state, context: context);
              } else if (state is UpdateUserError) {
                handleUpdateError(updateUserError: state, context: context);
              }
            },
          ),
        ],
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return ContractInformationUi(
              backButton: () => backButton(context),
              emailController: _emailController,
              confirmEmailController: _confirmEmailController,
              onChangedRequestAnInvoice: onChangedRequestAnInvoice,
              requestAnInvoice: requestAnInvoice,
              countryNameTextEditingController:
                  _countryNameTextEditingController,
              companyNameTextEditingController:
                  _companyNameTextEditingController,
              postalCodeController: _postalCodeController,
              houseNumberController: _houseNumberController,
              addressController: _addressController,
              passwordController: passwordController,
              lastNameController: _lastNameController,
              firstNameController: _firstNameController,
              cityController: _cityController,
              repeatPasswordController: repeatPasswordController,
              createAccount: createAccount,
              onChangedCreateAccount: onChangedCreateAccount,
              nextButton: () => nextButton(context),
              changeGender: _changeGender,
              userGender: _userGender,
              isConnected: widget.isConnected,
              tryGetUserAgain: () => getUserById(context),
              formKey: _formKey,
              autoValidate: _autoValidate,
              hasAccount: userCreated,
            );
          },
        ),
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void nextButton(BuildContext context) {
    setState(() {
      _autoValidate = true;
    });
    unFocusAppKeyBoard();
    if (_formKey.currentState?.validate() ?? false) {
      if (_isConnected) {
        updateUserApi(context);
      } else {
        if (userCreated) {
          updateUserApi(context);
        } else {
          signUpMethode(context);
        }
      }
    }
  }

  void signUpMethode(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(SignUpWithCredEvent(
        guest: !createAccount,
        password: passwordController.text,
        email: _emailController.text,
        lastName: _lastNameController.text,
        firstName: _firstNameController.text,
        gender: _userGender!.toDataBase,
        countryCode: getLocaleLanguageCode(context),
        postalCode: _postalCodeController.text,
        country: _countryNameTextEditingController.text,
        companyName: _companyNameTextEditingController.text,
        address: _addressController.text,
        houseNumber: _houseNumberController.text,
        city: _cityController.text));
  }

  void updateUserApi(BuildContext context) {
    if (_userModel != null) {
      BlocProvider.of<SignInBloc>(context).add(UpdateUserByIdEvent(
          lastName: _lastNameController.text,
          firstName: _firstNameController.text,
          id: _userModel!.id ?? "",
          gender: _userGender!.toDataBase,
          postalCode: _postalCodeController.text,
          country: _countryNameTextEditingController.text,
          companyName: _companyNameTextEditingController.text,
          address: _addressController.text,
          houseNumber: _houseNumberController.text,
          city: _cityController.text,
          userModel: _userModel!));
    }
  }

  void proceedToCheckout() {
    if (_userModel != null) {
      Navigator.pushNamed(
        context,
        checkoutPage,
        arguments: CheckoutPageParams(
          token: widget.token,
          licencePate: widget.licencePate,
          userModel: _userModel!,
          countryLicencePate: widget.countryLicencePate,
          licencePateRegEx: widget.licencePateRegEx,
        ),
      );
    }
  }

  void onChangedRequestAnInvoice(bool? newValue) {
    if (newValue != null) {
      setState(() {
        requestAnInvoice = newValue;
      });
    }
  }

  void onChangedCreateAccount(bool? newValue) {
    if (newValue != null) {
      setState(() {
        createAccount = newValue;
      });
    }
  }

  void _changeGender(UserGender? userGender) {
    setState(() {
      _userGender = userGender ?? UserGender.female;
    });
  }

  void getUserById(BuildContext context) {
    BlocProvider.of<SignInBloc>(context)
        .add(GetUserByIdEvent(token: widget.token));
  }

  void updateFields(UserModel userModel) {
    if (userModel.salutation != null) {
      _userGender = getUserGenderFromString(userModel.salutation!);
    }
    if (userModel.email != null) {
      _emailController.text = userModel.email!;
    }
    if (userModel.company != null) {
      _companyNameTextEditingController.text = userModel.company!;
    }
    if (userModel.zipCode != null) {
      _postalCodeController.text = userModel.zipCode!;
    }
    if (userModel.houseNumber != null) {
      _houseNumberController.text = userModel.houseNumber!;
    }
    if (userModel.street != null) {
      _addressController.text = userModel.street!;
    }
    if (userModel.city != null) {
      _cityController.text = userModel.city!;
    }
    if (userModel.lastName != null) {
      _lastNameController.text = userModel.lastName!;
    }
    if (userModel.firstName != null) {
      _firstNameController.text = userModel.firstName!;
    }
    if (userModel.country != null) {
      _countryNameTextEditingController.text = userModel.country!;
    }
  }

  void updateStatus({required UserModel userModel}) {
    setState(() {
      _userModel = userModel;
      if (hasGuest == false && userModel.hasAccount == false) {
        hasGuest = true;
      }
      if (userCreated == false && userModel.hasAccount == true) {
        userCreated = true;
      }
    });
  }

  void updateUser(UserModel userModel) {
    setState(() {
      _userModel = userModel;
    });
  }

  Future<void> handleSignUpError(
      {required SignInError signInError, required BuildContext context}) async {
    if (signInError.isInternetFailure) {
      final result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
      if (result) {
        signUpMethode(context);
      }
    } else if (signInError.isCredentialFailure) {
      await DialogUtils.showOKDialog(
          context: context,
          title: LocaleKeys.server_customer_exist_exception.tr(),
          confirmButtonText:
              LocaleKeys.login_pop_up_wrong_credential_confirm_button.tr(),
          content: signInError.message);
    } else {
      final result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
      if (result) {
        signUpMethode(context);
      }
    }
  }

  Future<void> handleUpdateError(
      {required UpdateUserError updateUserError,
      required BuildContext context}) async {
    if (updateUserError.isInternetFailure) {
      final result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
      if (result) {
        updateUserApi(context);
      }
    } else if (updateUserError.isCredentialFailure) {
      await DialogUtils.showOKDialog(
          context: context,
          title: LocaleKeys.server_customer_exist_exception.tr(),
          confirmButtonText:
              LocaleKeys.login_pop_up_wrong_credential_confirm_button.tr(),
          content: updateUserError.message);
    } else {
      final result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
      if (result) {
        updateUserApi(context);
      }
    }
  }
}
