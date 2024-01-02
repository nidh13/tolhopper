import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expandeble_card/product_expandeble_card.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expansion_other_countries/expansion_other_countries_card.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/countries_names_utils.dart';

class TollSelectionUi extends StatelessWidget {
  final GestureTapCallback? backButtonOnTap;
  final VoidCallback? nextButtonOnTap;
  final List<VignetteProduct> listVignetteAustria;
  final List<VignetteProduct> listVignetteSlovenia;
  final List<VignetteProduct> listVignetteSwitzerland;
  final List<VignetteProduct> listVignetteHungary;
  final List<VignetteProduct> listVignetteRomania;
  final List<VignetteProduct> listVignetteCzech;
  final List<VignetteProduct> listTollsAustria;
  final List<DefinedCountry> otherCountries;
  final bool hasVignette;
  final bool hasTolls;
  final bool hasSloveniaTolls;
  final bool hasAustriaTolls;
  final bool hasSwitzerlandTolls;
  final bool hasHungaryTolls;
  final bool hasRomaniaTolls;
  final bool hasCzechTolls;
  final bool hasSloveniaVignette;
  final bool hasAustriaVignette;
  final bool hasSwitzerlandVignette;
  final bool hasHungaryVignette;
  final bool hasRomaniaVignette;
  final bool hasCzechVignette;

  const TollSelectionUi({
    Key? key,
    required this.backButtonOnTap,
    required this.nextButtonOnTap,
    required this.otherCountries,
    required this.listVignetteSlovenia,
    required this.listVignetteAustria,
    required this.listVignetteSwitzerland,
    required this.listVignetteHungary,
    required this.listVignetteRomania,
    required this.listVignetteCzech,
    required this.listTollsAustria,
    required this.hasVignette,
    required this.hasTolls,
    required this.hasSloveniaTolls,
    required this.hasAustriaTolls,
    required this.hasSwitzerlandTolls,
    required this.hasHungaryTolls,
    required this.hasRomaniaTolls,
    required this.hasCzechTolls,
    required this.hasSloveniaVignette,
    required this.hasAustriaVignette,
    required this.hasSwitzerlandVignette,
    required this.hasHungaryVignette,
    required this.hasRomaniaVignette,
    required this.hasCzechVignette,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool canBuySomething = (listVignetteAustria.isNotEmpty ||
        listVignetteSlovenia.isNotEmpty ||
        listTollsAustria.isNotEmpty ||
        listVignetteSwitzerland.isNotEmpty ||
        listVignetteHungary.isNotEmpty ||
        listVignetteRomania.isNotEmpty ||
        listVignetteCzech.isNotEmpty);

    return Scaffold(
      backgroundColor: globalBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
        title: LocaleKeys.toll_selection_app_bar_title.tr(),
        hasBackButton: true,
        onTap: backButtonOnTap,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      (hasAustriaTolls || listVignetteAustria.isNotEmpty)
                          ? ProductExpansionCard(
                              listVignette: listVignetteAustria,
                              hasVignette: hasAustriaVignette,
                              hasTolls: hasAustriaTolls,
                              flagCode: FlagsCode.AT,
                              countryName:
                                  LocaleKeys.defined_countries_austria.tr(),
                              listTolls: listTollsAustria,
                              isExpanded: true,
                            )
                          : const SizedBox.shrink(),
                      (hasSloveniaTolls || listVignetteSlovenia.isNotEmpty)
                          ? ProductExpansionCard(
                              listVignette: listVignetteSlovenia,
                              hasVignette: hasSloveniaVignette,
                              hasTolls: hasSloveniaTolls,
                              flagCode: FlagsCode.SI,
                              countryName:
                                  LocaleKeys.defined_countries_slovenia.tr(),
                              listTolls: const [],
                              isExpanded: !(hasAustriaTolls ||
                                  listVignetteAustria.isNotEmpty),
                            )
                          : const SizedBox.shrink(),
                      (hasSwitzerlandTolls ||
                              listVignetteSwitzerland.isNotEmpty)
                          ? ProductExpansionCard(
                              listVignette: listVignetteSwitzerland,
                              hasVignette: hasSwitzerlandVignette,
                              hasTolls: hasSwitzerlandTolls,
                              flagCode: FlagsCode.CH,
                              countryName:
                                  LocaleKeys.defined_countries_switzerland.tr(),
                              listTolls: const [],
                              isExpanded: !((hasAustriaTolls ||
                                      listVignetteAustria.isNotEmpty) ||
                                  (hasSloveniaTolls ||
                                      listVignetteSlovenia.isNotEmpty)),
                            )
                          : const SizedBox.shrink(),
                      (hasHungaryTolls || listVignetteHungary.isNotEmpty)
                          ? ProductExpansionCard(
                              listVignette: listVignetteHungary,
                              hasVignette: hasHungaryVignette,
                              hasTolls: hasHungaryTolls,
                              flagCode: FlagsCode.HU,
                              countryName:
                                  LocaleKeys.defined_countries_hungary.tr(),
                              listTolls: const [],
                              isExpanded: !((hasAustriaTolls ||
                                      listVignetteAustria.isNotEmpty) ||
                                  (hasSloveniaTolls ||
                                      listVignetteSlovenia.isNotEmpty) ||
                                  (hasSwitzerlandTolls ||
                                      listVignetteSwitzerland.isNotEmpty)),
                            )
                          : const SizedBox.shrink(),
                      (hasCzechTolls || listVignetteCzech.isNotEmpty)
                          ? ProductExpansionCard(
                              listVignette: listVignetteCzech,
                              hasVignette: hasCzechVignette,
                              hasTolls: hasCzechTolls,
                              flagCode: FlagsCode.CZ,
                              countryName:
                                  LocaleKeys.defined_countries_czech.tr(),
                              listTolls: const [],
                              isExpanded: !((hasAustriaTolls ||
                                      listVignetteAustria.isNotEmpty) ||
                                  (hasSloveniaTolls ||
                                      listVignetteSlovenia.isNotEmpty) ||
                                  (hasSwitzerlandTolls ||
                                      listVignetteSwitzerland.isNotEmpty) ||
                                  (hasHungaryTolls ||
                                      listVignetteHungary.isNotEmpty) ||
                                  (hasCzechTolls ||
                                      listVignetteCzech.isNotEmpty)),
                            )
                          : const SizedBox.shrink(),
                      (hasRomaniaTolls || listVignetteRomania.isNotEmpty)
                          ? ProductExpansionCard(
                              listVignette: listVignetteRomania,
                              hasVignette: hasRomaniaVignette,
                              hasTolls: hasRomaniaTolls,
                              flagCode: FlagsCode.RO,
                              countryName:
                                  LocaleKeys.defined_countries_romania.tr(),
                              listTolls: const [],
                              isExpanded: !((hasAustriaTolls ||
                                      listVignetteAustria.isNotEmpty) ||
                                  (hasSloveniaTolls ||
                                      listVignetteSlovenia.isNotEmpty) ||
                                  (hasSwitzerlandTolls ||
                                      listVignetteSwitzerland.isNotEmpty) ||
                                  (hasHungaryTolls ||
                                      listVignetteHungary.isNotEmpty)),
                            )
                          : const SizedBox.shrink(),
                      otherCountries.isNotEmpty
                          ? ListView.builder(
                              itemCount: otherCountries.length,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ProductOtherCountriesExpansionCard(
                                  country: otherCountries[index],
                                  isExpanded: !canBuySomething && index == 0
                                      ? true
                                      : false,
                                );
                              })
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
            GlobalAppButton(
              text: LocaleKeys.next.tr(),
              onPressed: canBuySomething ? nextButtonOnTap : null,
              backGroundColor:
                  canBuySomething ? null : geryInputLoginBorderColor,
              textColor: canBuySomething ? null : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
