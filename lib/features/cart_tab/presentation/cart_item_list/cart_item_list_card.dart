import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/presentation/cart_item_list/cart_toll_widget.dart';

class CartItemCard extends StatelessWidget {
  final String? title;
  final String? price;
  final String? validityText;
  final int index;
  final GestureTapCallback? delete;
  final bool isToll;
  final bool getAnnualCard;
  final bool containCheckBox;
  final bool containAnnualCard;
  final bool hasTwoTrip;
  final bool annualCardChecked;
  const CartItemCard({
    Key? key,
    required this.title,
    required this.price,
    required this.validityText,
    required this.delete,
    required this.index,
    required this.getAnnualCard,
    required this.containAnnualCard,
    required this.containCheckBox,
    required this.hasTwoTrip,
    required this.isToll,
    required this.annualCardChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            CartTollWidget(
              title: title,
              price: price,
              validityText: validityText,
              isToll: isToll,
              getAnnualCard: getAnnualCard,
              containCheckBox: containCheckBox,
              containAnnualCard: containAnnualCard,
              hasTwoTrip: hasTwoTrip,
              annualCardChecked: annualCardChecked,
              changeHasAnnualCard: (value) {},
              changeHasTwoTrip: (value) {},
              hasDeleteButton: true,
              onDelete: delete,
            ),
          ],
        ),
      ),
    );
  }
}
