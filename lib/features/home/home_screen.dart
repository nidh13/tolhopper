import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/cart_tab/cart_tab_page.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/home/presentation/widgets/button_navigation_bar.dart';
import 'package:tollhopper/features/home/presentation/widgets/radio_enums/navigation_item.dart';
import 'package:tollhopper/features/home_tab/home_tab_page.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/my_vignettes/my_vignettes_page.dart';
import 'package:tollhopper/features/news_tab/new_tab_page.dart';
import 'package:tollhopper/features/toll_calculator/calculator_tab_page.dart';
import 'package:tollhopper/global/common_widgets/app_drawer/app_drawer.dart';
import 'package:tollhopper/global/common_widgets/app_drawer/app_drawer_enum.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _pageIndex = NavigationItemEnum.home.index;
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  String _price = "0";
  String _productNumber = "0";
  List<CartModel> _cart = [];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<SignInBloc>()..add(GetSplashScreenTestParamsEvent()),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>()..add(GetProductsFromCartEvent()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) async {
              if (state is LogOutState) {
                backToLogin(context);
              }
            },
          ),
          BlocListener<CartBloc, CartState>(
            listener: (context, state) async {
              if (state is CartSuccessState) {
                updateCart(
                    price: state.price,
                    list: state.listItems,
                    productNumber: state.listItems.length.toString());
              } else if (state is ProductsAddedState) {
                updateCart(
                    price: state.price,
                    list: state.listItems,
                    productNumber: state.listItems.length.toString());
                if (state.isFromHome) {
                  await DialogUtils.showOKDialog(
                      context: context,
                      title: LocaleKeys.cart_tab_add_product_pop_up_title.tr(),
                      confirmButtonText:
                          LocaleKeys.cart_tab_add_product_pop_up_ok_button.tr(),
                      content:
                          LocaleKeys.cart_tab_add_product_pop_up_text.tr());
                }
              } else if (state is CartEmptyState) {
                cleanCart();
              }
            },
          ),
        ],
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                key: homeScaffoldKey,
                drawer: AppDrawer(
                  logout: () => logout(context),
                  backToLogin: () => backToLogin(context),
                  navigateToPages: navigateFromDrawer,
                  changePage: changePageFromDrawer,
                ),
                body: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeTabPage(
                      scaffoldState: homeScaffoldKey,
                      price: _price,
                      numberProducts: _productNumber,
                      onTapCart: () => goToCart(),
                    ),
                    const MyVignettesPage(),
                    const CalculatorTabPage(),
                    const NewsTabPage(),
                    CartTabPage(
                      price: _price,
                      cart: _cart,
                    ),
                  ],
                ),
                bottomNavigationBar: AppButtonNavigationBar(
                  onTap: changePage,
                  currentIndex: _pageIndex,
                  productsNumber: _productNumber,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    final result = await DialogUtils.showLogoutDialog(context: context);
    if (result) {
      BlocProvider.of<SignInBloc>(context).add(LogoutEvent());
    }
  }

  void backToLogin(BuildContext context) {
    homeScaffoldKey.currentState?.openEndDrawer();
    Navigator.pushReplacementNamed(
      context,
      loginPage,
    );
  }

  void goToCart() {
    changePage(NavigationItemEnum.cart.index);
  }

  void changePage(int value) {
    setState(() {
      _pageIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  void changePageFromDrawer(int value) {
    setState(() {
      _pageIndex = value;
    });
    _pageController.jumpToPage(value);
    Navigator.pop(context);
  }

  void navigateFromDrawer({
    required AppDrawerEnum appDrawerEnum,
    dynamic settings,
  }) {
    if (appDrawerEnum.routes != "") {
      Navigator.pushNamed(context, appDrawerEnum.routes, arguments: settings);
    }
  }

  void updateCart({
    required String price,
    required String productNumber,
    required List<CartModel> list,
  }) {
    setState(() {
      _price = price;
      _productNumber = productNumber;
      _cart = list;
    });
  }

  void cleanCart() {
    setState(() {
      _price = "0.00";
      _productNumber = "0";
      _cart = [];
    });
  }
}
