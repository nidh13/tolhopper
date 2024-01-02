import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/home_tab/presentation/country_select_option/coutry_select_widget.dart';
import 'package:tollhopper/features/license_platform_information/presentation/bloc/license_plate_bloc.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/plat_form_bloc.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/select_option/car_energie_enum.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/country_app.dart';

class LicensePlateInformation extends StatelessWidget {
  final GestureTapCallback? backButtonOnTap;
  final VoidCallback? nextButtonOnTap;
  final CountryCode? country;
  final TextEditingController carNameController;
  final TextEditingController carModelController;
  final TextEditingController pateInformationFirstController;
  final TextEditingController pateInformationSecondController;
  final TextEditingController pateInformationThirdController;
  final TextEditingController confirmPateInformationFirstController;
  final TextEditingController confirmPateInformationSecondController;
  final TextEditingController confirmPateInformationThirdController;
  final ValueChanged<CountryCode>? countryChange;
  final CarEnergyEnum? carEnergyEnum;
  final void Function(CarEnergyEnum?) changeEnergyType;
  final bool firstPateIsValid;
  final bool secondPateIsValid;
  final String firstPateValidationText;
  final String secondPateValidationText;

  const LicensePlateInformation({
    Key? key,
    required this.nextButtonOnTap,
    required this.backButtonOnTap,
    required this.country,
    required this.carNameController,
    required this.carModelController,
    required this.pateInformationFirstController,
    required this.pateInformationSecondController,
    required this.pateInformationThirdController,
    required this.confirmPateInformationFirstController,
    required this.confirmPateInformationSecondController,
    required this.confirmPateInformationThirdController,
    required this.countryChange,
    required this.changeEnergyType,
    required this.firstPateIsValid,
    required this.carEnergyEnum,
    required this.secondPateIsValid,
    required this.firstPateValidationText,
    required this.secondPateValidationText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: CommonAppBar(
          title: LocaleKeys.license_information_app_bar_title.tr(),
          hasBackButton: true,
          onTap: backButtonOnTap,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        CountrySelectWidget(
                          country: country,
                          onChanged: countryChange,
                          hasBorder: true,
                          favoritesCountries: appFavoritesListCountries,
                        ),
                        const SizedBox(height: 15),
                        PateFormBloc(
                          secondController: pateInformationSecondController,
                          firstController: pateInformationFirstController,
                          countryCode: country,
                          thirdController: pateInformationThirdController,
                          title:
                              LocaleKeys.license_information_plate_number.tr(),
                          isValid: firstPateIsValid,
                          validationText: firstPateValidationText,
                          onChangedFirstInput: (value) {
                            sl<LicensePlateBloc>()
                                .add(FirstLicensePlateEvent(value));
                          },
                          onChangedSecondInput: (value) {
                            sl<LicensePlateBloc>()
                                .add(SecondLicensePlateEvent(value));
                          },
                          onChangedThirdInput: (value) {
                            sl<LicensePlateBloc>()
                                .add(ThirdLicensePlateEvent(value));
                          },
                        ),
                        PateFormBloc(
                          secondController:
                              confirmPateInformationSecondController,
                          firstController:
                              confirmPateInformationFirstController,
                          countryCode: country,
                          thirdController:
                              confirmPateInformationThirdController,
                          title: LocaleKeys
                              .license_information_confirm_plate_number
                              .tr(),
                          isValid: secondPateIsValid,
                          validationText: secondPateValidationText,
                          onChangedFirstInput: (value) {
                            sl<LicensePlateBloc>()
                                .add(ConfirmFirstLicensePlateEvent(value));
                          },
                          onChangedSecondInput: (value) {
                            sl<LicensePlateBloc>()
                                .add(ConfirmSecondLicensePlateEvent(value));
                          },
                          onChangedThirdInput: (value) {
                            sl<LicensePlateBloc>()
                                .add(ConfirmThirdLicensePlateEvent(value));
                          },
                        ),
                        country == CountryCode.fromDialCode("+40")
                            ? CommonTextFormBloc(
                                controller: carNameController,
                                hint: "Vin (Chassis Number)",
                                title: "Chassis Number",
                              )
                            : const SizedBox.shrink(),
                        // CommonTextFormBloc(
                        //   controller: carModelController,
                        //   hint: LocaleKeys.license_information_car_model_hint
                        //       .tr(),
                        //   title: LocaleKeys.license_information_car_model.tr(),
                        // ),
                        // CarEnergySelectOptionBloc(
                        //   carEnergyEnum: carEnergyEnum,
                        //   autoVal: true,
                        //   title: LocaleKeys.license_information_car_energy.tr(),
                        //   changeType: changeEnergyType,
                        //   hint: LocaleKeys.license_information_car_energy_hint
                        //       .tr(),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              GlobalAppButton(
                text: LocaleKeys.next.tr(),
                onPressed: nextButtonOnTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
