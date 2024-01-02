import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/presentation/app_bars/home_app_bar_cart.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_app_bar/login_logo.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/app_bars/svg_icon_with_action.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? openDrawer;
  final GestureTapCallback? onTapCart;
  final bool? hasBackButton;
  final String price;
  final String productNumber;
  const HomeAppBar({
    Key? key,
    this.openDrawer,
    this.hasBackButton,
    required this.price,
    required this.productNumber,
    required this.onTapCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          const Positioned.fill(
            child: Align(alignment: Alignment.bottomCenter, child: LoginLogo()),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SvgIconWithAction(
                  onTap: openDrawer,
                  icon: drawerIcon,
                ),
              ),
              HomeAppBarCartWidget(
                price: price,
                productNumber: productNumber,
                onTapCart: onTapCart,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
