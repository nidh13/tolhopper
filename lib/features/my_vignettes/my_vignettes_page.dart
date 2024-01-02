import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/login/login_page.dart';
import 'package:tollhopper/features/my_vignettes/presentation/bloc/vignette_bloc.dart';
import 'package:tollhopper/features/my_vignettes/presentation/my_vignettes_ui.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/vignette_list_enum.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/common_widgets/snack_bar/app_snack_bar.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class MyVignettesPage extends StatefulWidget {
  const MyVignettesPage({Key? key}) : super(key: key);

  @override
  State<MyVignettesPage> createState() => _MyVignettesPageState();
}

class _MyVignettesPageState extends State<MyVignettesPage> {
  int indexVignetteListSelected = VignettesListEnum.active.index;

  @override
  Widget build(BuildContext context) {
    final locale = getLocaleLanguageCode(context);
    return BlocProvider(
      create: (context) =>
          sl<VignetteBloc>()..add(GetVignettesHistory(language: locale)),
      child: BlocListener<VignetteBloc, VignetteState>(
        listener: (context, state) async {
          if (state is VignetteErrorState) {
            AppSnackBar.showSnackBar(context, state.message);
          }
        },
        child: BlocBuilder<VignetteBloc, VignetteState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: globalBackgroundColor,
                appBar: CommonAppBar(
                  title: LocaleKeys.drawer_vignette.tr(),
                ),
                body: myVignetteBody(state),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget myVignetteBody(VignetteState state) {
    if (state is VignetteLoading) {
      return const LoadingScreen();
    } else if (state is VignettesHistoryLoaded) {
      return MyVignettesUi(
        backButton: () => backButton(context),
        indexViewSelected: indexVignetteListSelected,
        firstButtonTap: goToActiveVignetteButton,
        secondButtonTap: goToExpiredVignetteButton,
        activeVignettes: state.activeVignettes,
        expiredVignettes: state.expiredVignettes,
        chosetolls: choseTolls,
        choseVignette: choseVignette,
      );
    } else if (state is UserNotConnected) {
      return const LoginPage(showSkip: false);
    }

    return const SizedBox.shrink();
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  // to switch between vignette view lists
  void goToActiveVignetteButton() {
    if (indexVignetteListSelected == VignettesListEnum.expired.index) {
      setState(() {
        indexVignetteListSelected = VignettesListEnum.active.index;
      });
    }
  }

  // to switch between vignette view lists
  void goToExpiredVignetteButton() {
    if (indexVignetteListSelected == VignettesListEnum.active.index) {
      setState(() {
        indexVignetteListSelected = VignettesListEnum.expired.index;
      });
    }
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

  void redirectToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, loginPage, (Route<dynamic> route) => false);
  }
}
