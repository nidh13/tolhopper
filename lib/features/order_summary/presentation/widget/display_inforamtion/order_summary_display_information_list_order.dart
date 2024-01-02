import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/display_inforamtion/order_sumarry_information_list_card.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class OrderSummaryDisplayInformationListOrder extends StatelessWidget {
  final List<CartModel> cart;
  const OrderSummaryDisplayInformationListOrder({Key? key, required this.cart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.checkout_order_summary.tr(),
          style: theme.textTheme.headline2
              ?.copyWith(color: labelBlackColor, fontSize: 13, height: 1.10),
        ),
        const SizedBox(
          height: 5,
        ),
        ListView.builder(
          itemCount: cart.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: OrderSummaryInformationListCard(
                packageName: cart[index].title,
                additionalFee: "238 €",
                subTotal: cart[index].displayPrice(),
              ),
            );
          },
        ),
      ],
    );
  }
}
