import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/pate_number_display_widget.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/validity_text_with_label.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/tollselction_text_with_icon.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class VignettesCardWidget extends StatelessWidget {
  final VoidCallback? downloadButton;
  final VoidCallback? extendButton;
  final String title;
  final String orderDate;
  final String validityDate;
  final CountryCode? countryCode;
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final bool isExpired;
  const VignettesCardWidget({
    Key? key,
    required this.downloadButton,
    required this.countryCode,
    required this.extendButton,
    required this.orderDate,
    required this.validityDate,
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
    this.isExpired = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: trajectoryCardBorderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            TollSelectionTextWithIcon(
              title: title,
              icon: calendarIcon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValidityTextWithLabel(
                    title: orderDate,
                    label: LocaleKeys.vignettes_order_date.tr(),
                  ),
                  isExpired
                      ? Text(
                          LocaleKeys.vignettes_expired.tr(),
                          style: theme.textTheme.headline5?.copyWith(
                              color: redErrorLoginInputColor,
                              fontSize: 11,
                              height: 1.65),
                        )
                      : ValidityTextWithLabel(
                          title: validityDate,
                          label: LocaleKeys.vignettes_validity_date.tr(),
                        )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: PateNumberDisplayWidget(
                countryCode: countryCode,
                thirdValue: thirdValue,
                secondValue: secondValue,
                firstValue: firstValue,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GlobalAppButton(
                    text: LocaleKeys.vignettes_downloadPdf.tr(),
                    onPressed: downloadButton,
                  ),
                ),
                Expanded(
                  child: GlobalAppButton(
                    text: LocaleKeys.vignettes_extend.tr(),
                    onPressed: extendButton,
                    backGroundColor: appSwitchButtonsSecondButtonColor,
                    textColor: homeGerySubTitleColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
