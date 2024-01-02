import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';
import 'package:tollhopper/global/utils/enums/product_type_enum.dart';
import 'package:tollhopper/global/utils/functions.dart';

import 'home_tol_list_cart.dart';

class HomeTollList extends StatefulWidget {
  final List<VignetteProduct> listProducts;
  final Function(CartModel) choseVignette;
  final Function(List<CartModel>) choseTolls;
  final PageController pageController;
  final void Function(int) onPageChanged;
  final int currentPage;

  const HomeTollList({
    Key? key,
    required this.listProducts,
    required this.choseVignette,
    required this.choseTolls,
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<HomeTollList> createState() => _HomeTollListState();
}

class _HomeTollListState extends State<HomeTollList> {
  @override
  Widget build(BuildContext context) {
    final appLanguage = getLocaleLanguageCode(context);
    return Column(
      children: [
        SizedBox(
          height: 360,
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.listProducts.length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) => widget.onPageChanged(value),
            itemBuilder: (context, index) {
              final generalDesc = widget.listProducts[index].generals
                  ?.firstWhere((element) => element.language == appLanguage);
              return HomeTollListCard(
                title: generalDesc?.title ?? "",
                index: index,
                validityText: generalDesc?.description ?? "",
                prices: widget.listProducts[index].prices ?? [],
                isVignette: widget.listProducts[index].type ==
                    ProductTypeEnum.vignette.name,
                changeIndexSelected: (value) {
                  setState(() {
                    widget.listProducts[index].indexPriceSelected = value;
                  });
                },
                indexSelected: widget.listProducts[index].indexPriceSelected,
                chose: () async {
                  if (widget.listProducts[index].type ==
                      ProductTypeEnum.vignette.name) {
                    final result = await DialogUtils.selectDateDialogFunction(
                        context: context);
                    if (result != null) {
                      widget.choseVignette(
                        widget.listProducts[index]
                            .getCartModelFromVignetteByPriceSelected(
                          dateStart: convertDateFormat(result),
                        ),
                      );
                    }
                  } else if (widget.listProducts[index].type ==
                      ProductTypeEnum.toll.name) {
                    final result = await DialogUtils.selectTollDialogFunction(
                        context: context,
                        vignetteProduct: widget.listProducts[index]);
                    if (result != null) {
                      widget.choseTolls(result);
                    }
                  }
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        widget.listProducts.isNotEmpty
            ? DotsIndicator(
                position: widget.currentPage.toDouble(),
                mainAxisAlignment: MainAxisAlignment.center,
                dotsCount: widget.listProducts.length,
                decorator: DotsDecorator(
                  color: globalBackgroundColor,
                  activeColor: globalBackgroundColor,
                  size: const Size.square(8.0),
                  activeSize: const Size(24.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
