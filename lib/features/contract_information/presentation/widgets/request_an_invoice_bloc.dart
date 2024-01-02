import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class RequestAnInvoiceBlocWidget extends StatelessWidget {
  final TextEditingController countryNameController;
  final TextEditingController cityController;
  final TextEditingController addressController;
  final TextEditingController houseNumberController;
  final TextEditingController postalCodeController;
  final TextEditingController companyNameController;
  final double? topPadding;
  const RequestAnInvoiceBlocWidget({
    Key? key,
    required this.countryNameController,
    required this.postalCodeController,
    required this.houseNumberController,
    required this.cityController,
    required this.addressController,
    this.topPadding,
    required this.companyNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 20),
      child: Column(
        children: [
          CommonTextFormBloc(
            controller: companyNameController,
            hint: LocaleKeys.contact_information_company_name_hint.tr(),
            title: LocaleKeys.contact_information_company_name_title.tr(),
            validateData: FormValidator.validateRequiredFields,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CommonTextFormBloc(
                  controller: addressController,
                  hint: LocaleKeys.contact_information_address_hint.tr(),
                  title: LocaleKeys.contact_information_address_title.tr(),
                  validateData: FormValidator.validateRequiredFields,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CommonTextFormBloc(
                  controller: houseNumberController,
                  hint: LocaleKeys.contact_information_house_num_hint.tr(),
                  title: LocaleKeys.contact_information_house_num_title.tr(),
                  validateData: FormValidator.validateRequiredFields,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CommonTextFormBloc(
                  controller: postalCodeController,
                  hint: LocaleKeys.contact_information_postal_code_hint.tr(),
                  title: LocaleKeys.contact_information_postal_code_title.tr(),
                  validateData: FormValidator.validateRequiredFields,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CommonTextFormBloc(
                  controller: cityController,
                  hint: LocaleKeys.contact_information_city_hint.tr(),
                  title: LocaleKeys.contact_information_city_title.tr(),
                  validateData: FormValidator.validateRequiredFields,
                ),
              ),
            ],
          ),
          CommonTextFormBloc(
            controller: countryNameController,
            hint: LocaleKeys.contact_information_country_hint.tr(),
            title: LocaleKeys.contact_information_country_title.tr(),
            validateData: FormValidator.validateRequiredFields,
          ),
        ],
      ),
    );
  }
}
