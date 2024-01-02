import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/login_page.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/user_profile/presentation/user_profile_ui.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';

import '../../global/theme/themes.dart';

class UserProfilePage extends StatefulWidget {
  final bool isUserConnected;
  const UserProfilePage({
    Key? key,
    required this.isUserConnected,
  }) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryNameTextEditingController =
      TextEditingController();
  final TextEditingController _companyNameTextEditingController =
      TextEditingController();
  UserGender? _userGender;
  UserModel? _userModel;
  bool _showCompanyDetails = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _houseNumberController.dispose();
    _postalCodeController.dispose();
    _countryNameTextEditingController.dispose();
    _companyNameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.drawer_account_settings.tr(),
          hasBackButton: true,
          onTap: () => leave(context),
        ),
        body: widget.isUserConnected
            ? BlocProvider(
                create: (context) => sl<SignInBloc>()..add(GetUserEvent()),
                child: BlocListener<SignInBloc, SignInState>(
                  listener: (context, state) async {
                    if (state is UserLoadedState) {
                      updateUser(state.userModel);
                      updateFields(state.userModel);
                    } else if (state is UserUpdatedState) {
                      updateUser(state.userModel);
                      leave(context);
                    } else if (state is UpdateUserError) {
                      handleUpdateError(
                          updateUserError: state, context: context);
                    }
                  },
                  child: BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return UserProfileUi(
                        backButton: () => leave(context),
                        userGender: _userGender,
                        isLoading: (state is SignInLoading),
                        changeGender: _changeGender,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        emailController: _emailController,
                        countryNameTextEditingController:
                            _countryNameTextEditingController,
                        companyNameTextEditingController:
                            _companyNameTextEditingController,
                        cityController: _cityController,
                        addressController: _addressController,
                        houseNumberController: _houseNumberController,
                        postalCodeController: _postalCodeController,
                        save: () => saveButton(context),
                        showCompanyDetails: _showCompanyDetails,
                        updateShowCompanyDetails: (value) =>
                            updateShowCompanyDetails(_showCompanyDetails),
                      );
                    },
                  ),
                ),
              )
            : const LoginPage(showSkip: false),
      ),
    );
  }

  void leave(BuildContext context) {
    Navigator.of(context).pop();
  }

  void saveButton(BuildContext context) {
    updateUserApi(context);
  }

  void _changeGender(UserGender? userGender) {
    setState(() {
      _userGender = userGender ?? UserGender.female;
    });
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

  void updateUserApi(BuildContext context) {
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

  void updateUser(UserModel userModel) {
    setState(() {
      _userModel = userModel;
    });
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

  Future<void> handleGetUserError({
    required GetUserError getUserError,
    required BuildContext context,
  }) async {
    if (getUserError.isInternetFailure) {
      final result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
      if (result) {
        getUser(context);
      }
    } else if (getUserError.isCredentialFailure) {
      await DialogUtils.showOKDialog(
          context: context,
          title: LocaleKeys.server_customer_exist_exception.tr(),
          confirmButtonText:
              LocaleKeys.login_pop_up_wrong_credential_confirm_button.tr(),
          content: getUserError.message);
    } else {
      final result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
      if (result) {
        getUser(context);
      }
    }
  }

  void getUser(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(GetUserEvent());
  }

  void updateShowCompanyDetails(bool? value) {
    setState(() {
      _showCompanyDetails = !_showCompanyDetails;
    });
  }
}
