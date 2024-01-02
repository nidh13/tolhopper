import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/presentation/cart_item_list/cart_toll_widget.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class TollListCard extends StatelessWidget {
  final bool isSelected;
  final GestureTapCallback? onTap;
  final String? title;
  final String? price;
  final String? validityText;
  final bool isToll;
  final bool hasTwoTrip;
  final ValueChanged<bool?>? changeHasTwoTrip;
  final ValueChanged<bool?>? changeHasAnnualCard;
  final bool containCheckBox;
  final bool containAnnualCard;
  final bool getAnnualCard;
  final bool annualCardChecked;
  const TollListCard(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.title,
      required this.validityText,
      required this.price,
      this.isToll = false,
      this.hasTwoTrip = false,
      this.containCheckBox = true,
      this.changeHasTwoTrip,
      this.getAnnualCard = false,
      this.annualCardChecked = false,
      this.changeHasAnnualCard,
      this.containAnnualCard = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CartTollWidget(
              validityText: validityText,
              price: price,
              title: title,
              hasBackGround: true,
              containCheckBox: containCheckBox,
              isToll: isToll,
              changeHasTwoTrip: changeHasTwoTrip,
              hasTwoTrip: hasTwoTrip,
              borderColor: isSelected ? selectionGreen : null,
              changeHasAnnualCard: changeHasAnnualCard,
              containAnnualCard: containAnnualCard,
              getAnnualCard: getAnnualCard,
              annualCardChecked: annualCardChecked,
            ),
            const SizedBox(
              width: 10,
            ),
            GlobalSvgIcon(icon: isSelected ? selectIcon : selectWhiteIcon),
          ],
        ),
      ),
    );
  }
}
