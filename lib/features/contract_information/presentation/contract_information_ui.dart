import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/features/contract_information/presentation/widgets/create_account_bloc_widget.dart';
import 'package:tollhopper/features/contract_information/presentation/widgets/request_an_invoice_bloc.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_checkbox.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/registre/presentation/widgets/gender_bloc.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/error_widget/no_conexion_widget.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class ContractInformationUi extends StatelessWidget {
  final GestureTapCallback? backButton;
  final TextEditingController emailController;
  final TextEditingController confirmEmailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController cityController;
  final TextEditingController addressController;
  final TextEditingController houseNumberController;
  final TextEditingController postalCodeController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;
  final ValueChanged<bool?>? onChangedRequestAnInvoice;
  final ValueChanged<bool?>? onChangedCreateAccount;
  final bool requestAnInvoice;
  final bool createAccount;
  final TextEditingController countryNameTextEditingController;
  final TextEditingController companyNameTextEditingController;
  final VoidCallback? nextButton;
  final UserGender? userGender;
  final Function changeGender;
  final bool isConnected;
  final bool hasAccount;
  final GestureTapCallback? tryGetUserAgain;
  final GlobalKey formKey;
  final bool autoValidate;

  const ContractInformationUi({
    Key? key,
    required this.backButton,
    required this.createAccount,
    required this.emailController,
    required this.confirmEmailController,
    required this.requestAnInvoice,
    required this.onChangedRequestAnInvoice,
    required this.countryNameTextEditingController,
    required this.passwordController,
    required this.lastNameController,
    required this.firstNameController,
    required this.addressController,
    required this.cityController,
    required this.houseNumberController,
    required this.postalCodeController,
    required this.companyNameTextEditingController,
    required this.repeatPasswordController,
    required this.onChangedCreateAccount,
    required this.nextButton,
    required this.changeGender,
    required this.userGender,
    required this.isConnected,
    required this.tryGetUserAgain,
    required this.formKey,
    required this.autoValidate,
    required this.hasAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.contact_information_app_bar_title.tr(),
          hasBackButton: true,
          onTap: backButton,
        ),
        body: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is GetUserLoading) {
              return const Center(child: LoadingScreen());
            } else if (state is GetUserError) {
              return NoConnexionWidget(
                text: state.message,
                icon:
                    (state.isInternetFailure) ? Icons.cloud_off : Icons.storage,
                tryAgain: tryGetUserAgain,
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      GenderBloc(
                        autoVal: true,
                        hasNotBackground: true,
                        gender: userGender,
                        changeGender: changeGender,
                        title: LocaleKeys.register_gender_title.tr(),
                        validateData: FormValidator.validateGender,
                      ),
                      CommonTextFormBloc(
                        controller: firstNameController,
                        hint: LocaleKeys.register_first_name_hint.tr(),
                        title: LocaleKeys.register_first_name_title.tr(),
                        validateData: FormValidator.validateRequiredFields,
                      ),
                      CommonTextFormBloc(
                        controller: lastNameController,
                        hint: LocaleKeys.register_last_name_hint.tr(),
                        title: LocaleKeys.register_last_name_title.tr(),
                        validateData: FormValidator.validateRequiredFields,
                      ),
                      CommonTextFormBloc(
                        controller: emailController,
                        hint: LocaleKeys.register_email_hint.tr(),
                        title: LocaleKeys.register_email_title.tr(),
                        readOnly: (isConnected || hasAccount),
                        isNotEmail: false,
                        validateData: FormValidator.validateEmail,
                      ),
                      !(isConnected || hasAccount)
                          ? CommonTextFormBloc(
                              controller: confirmEmailController,
                              hint: LocaleKeys.register_email_hint.tr(),
                              title: "Confirm Email",
                              readOnly: (isConnected || hasAccount),
                              isNotEmail: false,
                              validateData: (value) =>
                                  FormValidator.validateConfirmationEmail(
                                current: confirmEmailController,
                                other: emailController,
                              ),
                            )
                          : const SizedBox.shrink(),
                      (isConnected || hasAccount)
                          ? const SizedBox()
                          : LoginCheckBox(
                              title: LocaleKeys
                                  .contact_information_create_account
                                  .tr(),
                              onChanged: onChangedCreateAccount,
                              isChecked: createAccount,
                            ),
                      (isConnected || hasAccount)
                          ? const SizedBox()
                          : createAccount
                              ? CreateAccountBlocWidget(
                                  repeatPasswordController:
                                      repeatPasswordController,
                                  passwordController: passwordController,
                                )
                              : const SizedBox(),
                      SizedBox(
                        height: (isConnected || hasAccount)
                            ? 0
                            : createAccount
                                ? 0
                                : 20,
                      ),
                      LoginCheckBox(
                        title: LocaleKeys.contact_information_request_an_invoice
                            .tr(),
                        onChanged: onChangedRequestAnInvoice,
                        isChecked: requestAnInvoice,
                      ),
                      requestAnInvoice
                          ? RequestAnInvoiceBlocWidget(
                              addressController: addressController,
                              cityController: cityController,
                              countryNameController:
                                  countryNameTextEditingController,
                              houseNumberController: houseNumberController,
                              postalCodeController: postalCodeController,
                              companyNameController:
                                  companyNameTextEditingController,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 40,
                      ),
                      (state is SignInLoading)
                          ? const LoadingScreen()
                          : GlobalAppButton(
                              text: LocaleKeys.next.tr(),
                              onPressed: nextButton,
                            )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
