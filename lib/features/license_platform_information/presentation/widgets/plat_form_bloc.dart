import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/license_platform_information/presentation/pate_form_text_error.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/pate_number_widget.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_title.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class PateFormBloc extends StatelessWidget {
  final String title;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final CountryCode? countryCode;
  final bool isValid;
  final String? validationText;
  final void Function(String)? onChangedFirstInput;
  final void Function(String)? onChangedSecondInput;
  final void Function(String)? onChangedThirdInput;

  const PateFormBloc({
    Key? key,
    required this.thirdController,
    required this.countryCode,
    required this.secondController,
    required this.firstController,
    required this.title,
    this.validationText,
    this.isValid = true,
    this.onChangedFirstInput,
    this.onChangedSecondInput,
    this.onChangedThirdInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputNumber = getPateInformationInputNumber(countryCode);
    return inputNumber == 0
        ? CommonTextFormBloc(
            controller: firstController,
            hint: LocaleKeys.license_information_plate_number_hint.tr(),
            title: title,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFormTitle(
                title: title,
              ),
              PateContainerWidget(
                secondController: secondController,
                firstController: firstController,
                countryCode: countryCode,
                thirdController: thirdController,
                onChangedFirstInput: onChangedFirstInput,
                onChangedSecondInput: onChangedSecondInput,
                onChangedThirdInput: onChangedThirdInput,
              ),
              const SizedBox(
                height: 10,
              ),
              isValid
                  ? PateFormTextError(
                      text: validationText ?? "",
                      color: Colors.transparent,
                    )
                  : PateFormTextError(
                      text: validationText ?? "",
                      color: redErrorLoginInputColor,
                    ),
              const SizedBox(
                height: 7,
              ),
            ],
          );
  }
}
