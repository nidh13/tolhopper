import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/presentation/home_toll_list/home_vignette_list_vehicule.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/buttons/golbal_app_wihte_button.dart';
import 'package:tollhopper/global/common_widgets/icons/svg_icon_with_rouned_background.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class HomeTollListCard extends StatelessWidget {
  final String? title;
  final String? validityText;
  final int index;

  final List<VignetteProductPrices> prices;
  final bool isVignette;
  final int indexSelected;
  final Function(int) changeIndexSelected;
  final VoidCallback? chose;
  const HomeTollListCard({
    Key? key,
    required this.title,
    required this.validityText,
    required this.prices,
    required this.isVignette,
    required this.index,
    required this.indexSelected,
    required this.changeIndexSelected,
    required this.chose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: globalBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgIconWithRoundBackground(
                icon: calendarIcon,
                height: 35,
                width: 35,
                color: blueTextColor,
              ),
              const SizedBox(height: 10),
              Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headline2?.copyWith(
                    color: labelBlackColor, height: 1.31, fontSize: 14.31),
              ),
              const SizedBox(height: 15),
              isVignette
                  ? HomeVignetteListVehicule(
                      prices: prices,
                      indexSelected: indexSelected,
                      changeIndexSelected: changeIndexSelected,
                    )
                  : const SizedBox(height: 30),
              SizedBox(
                height: isVignette ? 20 : 10,
              ),
              Text(
                isVignette
                    ? formatPrice(prices[indexSelected].displayPrice())
                    : displayTollPrice(prices[indexSelected].displayPrice()),
                style: context.theme.textTheme.headline1?.copyWith(
                    color: blueTextColor, height: 0.6, fontSize: 30.63),
              ),
              const SizedBox(height: 10),
              Text(
                validityText ?? "",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headline5
                    ?.copyWith(color: homeGerySubTitleColor),
              ),
              SizedBox(
                height: isVignette ? 30 : 60,
              ),
              GlobalAppWhiteButton(
                text: LocaleKeys.home_tab_choose.tr(),
                onPressed: chose,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
