import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_checkbox.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/tollselction_text_with_icon.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/app_bars/svg_icon_with_action.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class CartTollWidget extends StatelessWidget {
  final String? title;
  final String? price;
  final String? validityText;
  final Color? borderColor;
  final bool hasBackGround;
  final bool isToll;
  final bool getAnnualCard;
  final bool containCheckBox;
  final bool containAnnualCard;
  final bool hasTwoTrip;
  final bool annualCardChecked;
  final ValueChanged<bool?>? changeHasTwoTrip;
  final ValueChanged<bool?>? changeHasAnnualCard;
  final GestureTapCallback? onDelete;
  final bool hasDeleteButton;
  const CartTollWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.validityText,
    this.hasBackGround = false,
    this.borderColor,
    this.hasTwoTrip = false,
    this.annualCardChecked = false,
    this.isToll = false,
    this.getAnnualCard = false,
    this.changeHasTwoTrip,
    this.containCheckBox = true,
    this.containAnnualCard = false,
    this.changeHasAnnualCard,
    this.hasDeleteButton = false,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? geryHintLoginInputColor,
            width: 0.7,
          ),
          color: hasBackGround ? globalBackgroundColor : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TollSelectionTextWithIcon(
                      title: title ?? "",
                      icon: calendarIcon,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    getTextWithAppCurrency(price),
                    style: theme.textTheme.headline1?.copyWith(
                      color: blueTextColor,
                      height: 1.13,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              isToll
                  ? containCheckBox
                      ? LoginCheckBox(
                          title: LocaleKeys.toll_selection_return_text.tr(),
                          onChanged: changeHasTwoTrip,
                          isChecked: hasTwoTrip,
                        )
                      : const SizedBox()
                  : Row(
                      children: [
                        const GlobalSvgIcon(
                          icon: calendarIcon,
                          height: 20,
                          width: 20,
                          color: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            validityText ?? "",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                            style: theme.textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
              getAnnualCard
                  ? const SizedBox(
                      height: 3,
                    )
                  : const SizedBox(),
              getAnnualCard
                  ? containAnnualCard
                      ? LoginCheckBox(
                          title: LocaleKeys.toll_selection_annual_card.tr(),
                          onChanged: changeHasAnnualCard,
                          isChecked: annualCardChecked,
                        )
                      : const SizedBox()
                  : const SizedBox(),
              hasDeleteButton
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgIconWithAction(
                          icon: trashIcon,
                          color: redErrorLoginInputColor,
                          onTap: onDelete,
                          height: 18,
                          width: 18,
                        )
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
