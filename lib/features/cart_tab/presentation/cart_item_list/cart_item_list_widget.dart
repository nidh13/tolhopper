import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/cart_item_list/cart_item_list_card.dart';
import 'package:tollhopper/global/utils/enums/product_type_enum.dart';

class CartItemListWidget extends StatelessWidget {
  final List<CartModel> cart;
  final Function(String, BuildContext) delete;
  const CartItemListWidget({Key? key, required this.cart, required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          itemCount: cart.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CartItemCard(
              index: index,
              validityText: cart[index].getDescriptionWithLanguageCode(context),
              price: cart[index].displayPrice(),
              title: cart[index].getTitleWithLanguageCode(context),
              delete: () => delete(cart[index].id, context),
              annualCardChecked: cart[index].isAnnualCard,
              hasTwoTrip: cart[index].hasTwoTrip,
              containAnnualCard: cart[index].isAnnualCard,
              containCheckBox: cart[index].hasTwoTrip,
              getAnnualCard: true,
              isToll: cart[index].productType == ProductTypeEnum.toll.name,
            );
          }),
    );
  }
}
