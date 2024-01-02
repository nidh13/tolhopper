import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/toll_list_card.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class SelectTollDialog extends StatefulWidget {
  final VignetteProduct vignetteProduct;
  const SelectTollDialog({
    Key? key,
    required this.vignetteProduct,
  }) : super(key: key);

  @override
  State<SelectTollDialog> createState() => _SelectTollDialogState();
}

class _SelectTollDialogState extends State<SelectTollDialog> {
  @override
  Widget build(BuildContext context) {
    final appLanguage = getLocaleLanguageCode(context);
    final toll = widget.vignetteProduct;
    final listPrice = widget.vignetteProduct.prices
        ?.where((element) => element.option == "1 Trip")
        .toList();
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: globalBackgroundColor,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: globalBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.cancel,
                        color: redErrorLoginInputColor,
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: ListView.builder(
                        itemCount: listPrice?.length ?? 0,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final generalDesc = toll.generals?.firstWhere(
                              (element) => element.language == appLanguage);
                          final price = listPrice?[index].displayPrice();
                          final twoTripPrice =
                              listPrice?[index].displayTwoTripPrice();
                          final annualCardPrice =
                              listPrice?[index].displayAnnualCardPrice();
                          return TollListCard(
                            getAnnualCard: true,
                            isSelected: listPrice?[index].selected ?? false,
                            validityText: generalDesc?.description,
                            price: (listPrice?[index].hasTwoTripSelected ==
                                    true)
                                ? twoTripPrice
                                : (listPrice?[index].hasAnnualCardSelected ==
                                        true)
                                    ? annualCardPrice
                                    : price,
                            containCheckBox:
                                listPrice?[index].hasTwoTRip ?? false,
                            containAnnualCard:
                                listPrice?[index].hasAnnualCard ?? false,
                            title: listPrice?[index].name ?? "",
                            isToll: true,
                            hasTwoTrip:
                                listPrice?[index].hasTwoTripSelected ?? false,
                            annualCardChecked:
                                listPrice?[index].hasAnnualCardSelected ??
                                    false,
                            changeHasTwoTrip: (value) {
                              setState(() {
                                listPrice?[index].hasTwoTripSelected =
                                    value ?? false;
                                listPrice?[index].hasAnnualCardSelected = false;
                              });
                            },
                            changeHasAnnualCard: (value) {
                              setState(() {
                                listPrice?[index].hasAnnualCardSelected =
                                    value ?? false;
                                listPrice?[index].hasTwoTripSelected = false;
                              });
                            },
                            onTap: () {
                              setState(() {
                                if (listPrice?[index].selected == false) {
                                  listPrice?[index].selected = true;
                                } else {
                                  listPrice?[index].selected = false;
                                }
                              });
                            },
                          );
                        }),
                  ),
                ),
                GlobalAppButton(
                  text: LocaleKeys.choose.tr(),
                  onPressed: () => widget.vignetteProduct
                          .getCartModelFromToll()
                          .isEmpty
                      ? selectSomethingDialog(context)
                      : Navigator.of(context)
                          .pop(widget.vignetteProduct.getCartModelFromToll()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
