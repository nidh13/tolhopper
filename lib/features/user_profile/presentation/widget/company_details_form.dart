import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/contract_information/presentation/widgets/request_an_invoice_bloc.dart';
import 'package:tollhopper/features/user_profile/presentation/widget/user_profile_form_header.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class CompanyDetailsForm extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController addressController;
  final TextEditingController houseNumberController;
  final TextEditingController postalCodeController;
  final TextEditingController countryNameTextEditingController;
  final TextEditingController companyNameTextEditingController;
  const CompanyDetailsForm({
    Key? key,
    required this.postalCodeController,
    required this.houseNumberController,
    required this.addressController,
    required this.cityController,
    required this.companyNameTextEditingController,
    required this.countryNameTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfileFormHeader(
          text: LocaleKeys.personal_settings_company_details.tr(),
        ),
        RequestAnInvoiceBlocWidget(
          companyNameController: companyNameTextEditingController,
          cityController: cityController,
          addressController: addressController,
          houseNumberController: houseNumberController,
          postalCodeController: postalCodeController,
          countryNameController: countryNameTextEditingController,
          topPadding: 0,
        )
      ],
    );
  }
}
