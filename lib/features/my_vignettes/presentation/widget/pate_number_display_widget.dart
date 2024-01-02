import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/vignette_display_text.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/vignette_pate_number_group_text.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';

class PateNumberDisplayWidget extends StatelessWidget {
  final CountryCode? countryCode;
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  const PateNumberDisplayWidget({
    Key? key,
    required this.countryCode,
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputNumber = getPateInformationInputNumber(countryCode);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedIconColor, // Border color
          width: 0.7, // Border width
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0), // Border radius
        ),
        color: globalBackgroundColor,
      ),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 2.0, // Border width
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0), // Border radius
          ),
          color: globalBackgroundColor,
        ),
        child: Row(
          children: [
            countryCode?.code == switzerlandCode
                ? const GlobalSvgIcon(
                    icon: switzerlandIcon,
                    height: 60,
                    width: 50,
                  )
                : Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6.0),
                          topLeft: Radius.circular(6.0) // Border radius
                          ),
                      color: bluePateNumberColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const GlobalSvgIcon(icon: euroIcon),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              getPlateInformationTitle(countryCode),
                              style: theme.textTheme.headline3
                                  ?.copyWith(color: globalBackgroundColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            (inputNumber == 1)
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: VignetteDisplayText(
                        value: firstValue,
                      ),
                    ),
                  )
                : VignettePateNumberGroupText(
                    countryCode: countryCode,
                    firstValue: firstValue,
                    secondValue: secondValue,
                    thirdValue: thirdValue,
                  )
          ],
        ),
      ),
    );
  }
}
