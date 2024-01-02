import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/pate_information_input.dart';
import 'package:tollhopper/global/utils/functions.dart';

class PateNumberForm extends StatelessWidget {
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final CountryCode? countryCode;
  final void Function(String)? onChangedFirstInput;
  final void Function(String)? onChangedSecondInput;
  final void Function(String)? onChangedThirdInput;

  const PateNumberForm({
    Key? key,
    required this.firstController,
    required this.secondController,
    required this.countryCode,
    required this.thirdController,
    this.onChangedFirstInput,
    this.onChangedSecondInput,
    this.onChangedThirdInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int inputNUmber = getPateInformationInputNumber(countryCode);
    int firstInputLength = getPlateInformationFirstLength(countryCode);
    int secondInputLength = getPlateInformationSecondLength(countryCode);
    return Expanded(
      child: (inputNUmber == 1)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PateInformationInput(
                controller: firstController,
                hint: getPlateInformationFirstHint(countryCode),
                onChanged: onChangedFirstInput,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: getPlateInformationFirstInputFlex(countryCode),
                    child: PateInformationInput(
                      controller: firstController,
                      validateData: null,
                      hint: getPlateInformationFirstHint(countryCode),
                      maxLength: getPlateInformationFirstLength(countryCode),
                      onChanged: onChangedFirstInput,
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: getPlateInformationSecondInputFlex(countryCode),
                    child: PateInformationInput(
                      controller: secondController,
                      validateData: null,
                      hint: getPlateInformationSecondHint(countryCode),
                      maxLength: getPlateInformationSecondLength(countryCode),
                      onChanged: onChangedSecondInput,
                    ),
                  ),
                  (inputNUmber == 3)
                      ? const Expanded(flex: 1, child: SizedBox())
                      : const SizedBox(),
                  (inputNUmber == 3)
                      ? Expanded(
                          flex: getPlateInformationThirdInputFlex(countryCode),
                          child: PateInformationInput(
                            controller: thirdController,
                            validateData: null,
                            hint: getPlateInformationThirdHint(countryCode),
                            maxLength:
                                getPlateInformationThirdLength(countryCode),
                            onChanged: onChangedThirdInput,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
    );
  }
}
