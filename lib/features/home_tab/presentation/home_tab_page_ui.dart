import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/home_tab/presentation/app_bars/home_app_bar.dart';
import 'package:tollhopper/features/home_tab/presentation/bloc/product_bloc.dart';
import 'package:tollhopper/features/home_tab/presentation/country_select_option/coutry_select_widget.dart';
import 'package:tollhopper/features/home_tab/presentation/headear/home_tab_header.dart';
import 'package:tollhopper/features/home_tab/presentation/photo_view/image_full_screen.dart';
import 'package:tollhopper/global/common_widgets/error_widget/no_conexion_widget.dart';
import 'package:tollhopper/global/common_widgets/image_netWork/image_netork_widget.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/geo_locator_bloc/presentation/bloc/geo_locator_bloc.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';

import 'home_toll_list/toll_list.dart';

class HomeTabPageUi extends StatelessWidget {
  final GestureTapCallback? openDrawer;
  final GestureTapCallback? onTapCart;
  final String price;
  final String productNumber;
  final CountryCode country;
  final ValueChanged<CountryCode>? countryChange;
  final GestureTapCallback? tryAgain;
  final Function(CartModel) choseVignette;
  final Function(List<CartModel>) choseTolls;
  final PageController pageController;
  final void Function(int) onPageChanged;
  final int currentPage;
  final List<String> listMap;

  const HomeTabPageUi({
    Key? key,
    required this.openDrawer,
    required this.price,
    required this.country,
    required this.productNumber,
    required this.tryAgain,
    required this.countryChange,
    required this.choseVignette,
    required this.choseTolls,
    required this.onTapCart,
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
    required this.listMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: HomeAppBar(
          openDrawer: openDrawer,
          productNumber: productNumber,
          price: price,
          onTapCart: onTapCart,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                color: appPrimaryColor,
                width: double.infinity,
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    return BlocBuilder<GeoLocatorBloc, GeoLocatorState>(
                      builder: (context, locationState) {
                        if (state is ProductLoadingState ||
                            state is CountryMapLoadingState ||
                            locationState is LocationLoading) {
                          return const LoadingScreen(
                            color: globalBackgroundColor,
                          );
                        }
                        if (state is ListProductLoadedState) {
                          return CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                        top: 30,
                                        bottom: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          HomeTabHeader(
                                            title:
                                                LocaleKeys.home_tab_title.tr(),
                                          ),
                                          CountrySelectWidget(
                                            country: country,
                                            onChanged: countryChange,
                                            hideSearch: true,
                                            countriesDisplay: appListCountries,
                                            hasSize: true,
                                            sizeHeight: 100,
                                            sizeWidth: screenWidth,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: HomeTollList(
                                  listProducts: getListProductsByCountryCode(
                                    countryCode: country,
                                    allProducts: state.listProduct,
                                  ),
                                  choseTolls: choseTolls,
                                  choseVignette: choseVignette,
                                  onPageChanged: onPageChanged,
                                  currentPage: currentPage,
                                  pageController: pageController,
                                ),
                              ),
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FullScreenImage(
                                            image:
                                                "$contentApiBaseUrl${listMap[getMapIndexFromCountry()]}",
                                          ),
                                        ),
                                      );
                                    },
                                    child: ImageNetworkWidget(
                                      imageUrl:
                                          "$contentApiBaseUrl${listMap[getMapIndexFromCountry()]}",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (state is ProductError) {
                          return NoConnexionWidget(
                            text: state.message,
                            icon: (state.isIntentFailure)
                                ? Icons.cloud_off
                                : Icons.storage,
                            tryAgain: tryAgain,
                          );
                        }
                        return const SizedBox();
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int getMapIndexFromCountry() {
    if (country.code == austriaCode) {
      return 0;
    }
    switch (country.code) {
      case austriaCode:
        return 0;
      case czeChiaCode:
        return 1;
      case hungaryCode:
        return 2;
      case sloveniaCode:
        return 3;
      case switzerlandCode:
        return 4;
      default:
        return 0;
    }
    return 1;
  }
}
