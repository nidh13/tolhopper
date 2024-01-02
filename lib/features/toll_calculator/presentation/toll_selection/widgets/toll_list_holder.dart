import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/toll_list_card.dart';
import 'package:tollhopper/global/utils/functions.dart';

class VignetteListContainer extends StatefulWidget {
  final bool hasVignette;
  final List<VignetteProduct> listVignette;
  const VignetteListContainer(
      {Key? key, required this.hasVignette, required this.listVignette})
      : super(key: key);

  @override
  State<VignetteListContainer> createState() => _VignetteListContainerState();
}

class _VignetteListContainerState extends State<VignetteListContainer> {
  @override
  Widget build(BuildContext context) {
    final appLanguage = getLocaleLanguageCode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: ListView.builder(
          itemCount: widget.listVignette.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final generalDesc = widget.listVignette[index].generals
                ?.firstWhere((element) => element.language == appLanguage);
            final price =
                widget.listVignette[index].prices?.first.displayPrice();
            return TollListCard(
              isSelected: widget.listVignette[index].selected,
              validityText: generalDesc?.description,
              price: formatPriceNoCurrency(price),
              title: generalDesc?.title,
              onTap: () {
                setState(() {
                  widget.listVignette[index].selected =
                      !widget.listVignette[index].selected;
                });
              },
            );
          }),
    );
  }
}
