import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expandeble_card/free_text_container.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/toll_list_holder.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/tolls_list_container.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class ProductExpansionCardBody extends StatelessWidget {
  final bool hasTolls;
  final bool hasVignette;
  final List<VignetteProduct> listVignette;
  final List<VignetteProduct> listTolls;
  const ProductExpansionCardBody({
    Key? key,
    required this.hasVignette,
    required this.hasTolls,
    required this.listVignette,
    required this.listTolls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      decoration: const BoxDecoration(
        color: iconWithCircularBackgroundColor,
        border: Border(
          right: BorderSide(
            color: trajectoryCardBorderColor, // Color of the right border
            width: 1.0, // Width of the right border
          ),
          left: BorderSide(
            color: trajectoryCardBorderColor, // Color of the left border
            width: 1.0, // Width of the left border
          ),
          bottom: BorderSide(
            color: trajectoryCardBorderColor, // Color of the bottom border
            width: 1.0, // Width of the bottom border
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.toll_selection_vignette.tr(),
            style: theme.textTheme.headline1
                ?.copyWith(color: labelBlackColor, fontSize: 14, height: 1),
          ),
          listVignette.isNotEmpty
              ? VignetteListContainer(
                  hasVignette: hasVignette,
                  listVignette: listVignette,
                )
              : hasVignette
                  ? const FreeTextContainer()
                  : const FreeTextContainer(comingSoon: false),
          Text(
            LocaleKeys.toll_selection_tolls.tr(),
            style: theme.textTheme.headline1
                ?.copyWith(color: labelBlackColor, fontSize: 14, height: 1),
          ),
          listTolls.isNotEmpty
              ? TollsListContainer(
                  hasTolls: hasTolls,
                  listTolls: listTolls,
                )
              : hasTolls
                  ? const FreeTextContainer()
                  : const FreeTextContainer(comingSoon: false)
        ],
      ),
    );
  }
}
