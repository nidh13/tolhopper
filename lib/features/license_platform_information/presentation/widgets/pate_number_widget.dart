import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/pate_number_for_widget.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';

class PateContainerWidget extends StatelessWidget {
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final CountryCode? countryCode;
  final void Function(String)? onChangedFirstInput;
  final void Function(String)? onChangedSecondInput;
  final void Function(String)? onChangedThirdInput;

  const PateContainerWidget({
    Key? key,
    required this.secondController,
    required this.firstController,
    required this.countryCode,
    required this.thirdController,
    this.onChangedFirstInput,
    this.onChangedSecondInput,
    this.onChangedThirdInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            PateNumberForm(
              firstController: firstController,
              secondController: secondController,
              countryCode: countryCode,
              thirdController: thirdController,
              onChangedFirstInput: onChangedFirstInput,
              onChangedSecondInput: onChangedSecondInput,
              onChangedThirdInput: onChangedThirdInput,
            ),
          ],
        ),
      ),
    );
  }
}
