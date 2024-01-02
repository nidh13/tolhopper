import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/cart_item_list/cart_item_list_widget.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class CartTabUi extends StatelessWidget {
  final String price;
  final VoidCallback? checkout;
  final List<CartModel> cart;
  final bool isLoading;
  final bool isEmpty;
  final Function(String, BuildContext) delete;
  const CartTabUi({
    Key? key,
    required this.checkout,
    required this.price,
    required this.isLoading,
    required this.cart,
    required this.isEmpty,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.cart_tab_app_bar_title.tr(),
        ),
        body: isLoading
            ? const Center(child: LoadingScreen())
            : isEmpty
                ? Center(
                    child: Text(
                      LocaleKeys.cart_tab_empty_cart_text.tr(),
                      style: theme.textTheme.headline3,
                    ),
                  )
                : cart.isNotEmpty
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.5, horizontal: 15),
                          child: Column(
                            children: [
                              CartItemListWidget(cart: cart, delete: delete),
                              const SizedBox(
                                height: 22.5,
                              ),
                              GlobalAppButton(
                                text: checkoutText(
                                  title: LocaleKeys.cart_tab_checkout.tr(),
                                  price: formatPrice(price),
                                ),
                                onPressed: checkout,
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Center(child: LoadingScreen()),
      ),
    );
  }
}
