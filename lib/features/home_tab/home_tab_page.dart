import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/home_tab/presentation/bloc/product_bloc.dart';
import 'package:tollhopper/features/home_tab/presentation/home_tab_page_ui.dart';
import 'package:tollhopper/global/geo_locator_bloc/presentation/bloc/geo_locator_bloc.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';

class HomeTabPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;

  final String price;
  final String numberProducts;
  final GestureTapCallback? onTapCart;

  const HomeTabPage({
    Key? key,
    required this.scaffoldState,
    required this.price,
    required this.numberProducts,
    required this.onTapCart,
  }) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  CountryCode countrySelected = CountryCode.fromCountryCode(austriaCode);
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List<String> listMap = <String>[];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GeoLocatorBloc>()..add(GetCurrentLocation()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) async {
              if (state is CountryMapLoadedState) {
                listMap = state.countriesMap;
              }
            },
          ),
          BlocListener<GeoLocatorBloc, GeoLocatorState>(
            listener: (context, state) {
              if (state is LocationLoaded || state is LocationFailed) {
                if (state is LocationLoaded) {
                  setState(() {
                    countrySelected = state.countryCode;
                  });
                }
                BlocProvider.of<ProductBloc>(context)
                  ..add(GetCountryMapEvent())
                  ..add(GetProductsEvent());
              }
            },
          ),
        ],
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return HomeTabPageUi(
              openDrawer: opedDrawer,
              price: formatPriceNoCurrency(widget.price),
              productNumber: widget.numberProducts,
              country: countrySelected,
              countryChange: changeCountry,
              tryAgain: () => getProducts(context),
              choseVignette: choseVignette,
              choseTolls: choseTolls,
              onTapCart: widget.onTapCart,
              pageController: pageController,
              currentPage: currentPage,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              listMap: listMap,
            );
          },
        ),
      ),
    );
  }

  void changeCountry(CountryCode? country) {
    setState(() {
      if (country != null) {
        countrySelected = country;
        currentPage = 0;
        pageController.jumpToPage(0);
      }
    });
  }

  void getProducts(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
  }

  void opedDrawer() {
    widget.scaffoldState.currentState?.openDrawer();
  }

  void choseVignette(CartModel cartModel) {
    BlocProvider.of<CartBloc>(context).add(
      AddProductsEvent(listProducts: [cartModel], isFromHome: true),
    );
  }

  void choseTolls(List<CartModel> cartModel) {
    BlocProvider.of<CartBloc>(context).add(
      AddProductsEvent(listProducts: cartModel, isFromHome: true),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
