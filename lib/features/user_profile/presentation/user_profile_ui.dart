import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_checkbox.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/features/user_profile/presentation/widget/company_details_form.dart';
import 'package:tollhopper/features/user_profile/presentation/widget/personal_details_form.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class UserProfileUi extends StatelessWidget {
  final GestureTapCallback? backButton;
  final GestureTapCallback? save;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final UserGender? userGender;
  final Function changeGender;
  final TextEditingController cityController;
  final TextEditingController addressController;
  final TextEditingController houseNumberController;
  final TextEditingController postalCodeController;
  final TextEditingController countryNameTextEditingController;
  final TextEditingController companyNameTextEditingController;
  final ValueChanged<bool?>? updateShowCompanyDetails;
  final bool showCompanyDetails;
  final bool isLoading;
  const UserProfileUi({
    Key? key,
    required this.backButton,
    required this.lastNameController,
    required this.firstNameController,
    required this.emailController,
    required this.userGender,
    required this.changeGender,
    required this.cityController,
    required this.countryNameTextEditingController,
    required this.companyNameTextEditingController,
    required this.addressController,
    required this.houseNumberController,
    required this.postalCodeController,
    required this.save,
    this.isLoading = false,
    this.updateShowCompanyDetails,
    required this.showCompanyDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        /*SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.drawer_account_settings.tr(),
          hasBackButton: true,
          onTap: backButton,
        ),
        body: */
        Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PersonalDetails(
                        emailController: emailController,
                        lastNameController: lastNameController,
                        firstNameController: firstNameController,
                        changeGender: changeGender,
                        userGender: userGender,
                        backButton: backButton,
                      ),
                      LoginCheckBox(
                        title: LocaleKeys.contact_information_request_an_invoice
                            .tr(),
                        onChanged: updateShowCompanyDetails,
                        isChecked: showCompanyDetails,
                      ),
                      const SizedBox(height: 20),
                      showCompanyDetails
                          ? CompanyDetailsForm(
                              postalCodeController: postalCodeController,
                              houseNumberController: houseNumberController,
                              addressController: addressController,
                              cityController: cityController,
                              companyNameTextEditingController:
                                  companyNameTextEditingController,
                              countryNameTextEditingController:
                                  countryNameTextEditingController,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: GlobalAppButton(
                text: LocaleKeys.save.tr(),
                onPressed: save,
              ),
            )
          ],
        ),
        isLoading ? const Center(child: LoadingScreen()) : const SizedBox()
      ],
      //   ),
      // ),
    );
  }
}
