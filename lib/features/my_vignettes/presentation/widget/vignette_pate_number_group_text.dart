import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/vignette_display_text.dart';
import 'package:tollhopper/global/utils/functions.dart';

class VignettePateNumberGroupText extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final CountryCode? countryCode;
  const VignettePateNumberGroupText({
    Key? key,
    required this.thirdValue,
    required this.secondValue,
    required this.countryCode,
    required this.firstValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int inputNUmber = getPateInformationInputNumber(countryCode);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Expanded(
              flex: (inputNUmber == 3) ? 2 : 1,
              child: VignetteDisplayText(
                value: firstValue,
              ),
            ),
            SizedBox(
              width: (inputNUmber == 3) ? 5 : 10,
            ),
            Expanded(
              flex: 2,
              child: VignetteDisplayText(
                value: secondValue,
              ),
            ),
            (inputNUmber == 3)
                ? const SizedBox(
                    width: 5,
                  )
                : const SizedBox(),
            (inputNUmber == 3)
                ? Expanded(
                    flex: 3,
                    child: VignetteDisplayText(
                      value: thirdValue,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
