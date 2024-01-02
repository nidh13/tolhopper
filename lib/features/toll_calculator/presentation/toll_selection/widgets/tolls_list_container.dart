import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/toll_list_card.dart';
import 'package:tollhopper/global/utils/functions.dart';

class TollsListContainer extends StatefulWidget {
  final bool hasTolls;
  final List<VignetteProduct> listTolls;
  const TollsListContainer(
      {Key? key, required this.hasTolls, required this.listTolls})
      : super(key: key);

  @override
  State<TollsListContainer> createState() => _TollsListContainerState();
}

class _TollsListContainerState extends State<TollsListContainer> {
  @override
  Widget build(BuildContext context) {
    final appLanguage = getLocaleLanguageCode(context);
    final toll = widget.listTolls.first;
    final listPrice =
        toll.prices?.where((element) => element.option == "1 Trip").toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.5),
      child: ListView.builder(
          itemCount: listPrice?.length ?? 0,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final generalDesc = toll.generals
                ?.firstWhere((element) => element.language == appLanguage);
            final price =
                formatPriceNoCurrency(listPrice?[index].displayPrice());

            final twoTripPrice = listPrice?[index].displayTwoTripPrice();
            return TollListCard(
              isSelected: listPrice?[index].selected ?? false,
              validityText: generalDesc?.description,
              price: (listPrice?[index].hasTwoTripSelected == true)
                  ? twoTripPrice
                  : price,
              containCheckBox: listPrice?[index].hasTwoTRip ?? false,
              title: listPrice?[index].name ?? "",
              isToll: true,
              hasTwoTrip: listPrice?[index].hasTwoTripSelected ?? false,
              changeHasTwoTrip: (value) {
                setState(() {
                  listPrice?[index].hasTwoTripSelected = value ?? false;
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
    );
  }
}
