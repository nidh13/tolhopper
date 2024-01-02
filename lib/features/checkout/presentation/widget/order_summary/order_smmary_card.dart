import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/checkout/presentation/widget/order_summary/order_summary_package_list.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryCard extends StatelessWidget {
  final List<CartModel> cart;

  const OrderSummaryCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.checkout_order_summary.tr(),
          style: context.theme.textTheme.headline1?.copyWith(
            color: labelBlackColor,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 12.5,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: geryCheckoutBorder, width: 1),
            borderRadius: BorderRadius.zero,
            color: globalBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: OrderSummaryPackageList(cart: cart),
          ),
        ),
      ],
    );
  }
}
