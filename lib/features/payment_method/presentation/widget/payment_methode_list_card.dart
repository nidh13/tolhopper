import 'package:flutter/material.dart';
import 'package:tollhopper/features/payment_method/presentation/widget/payment_methode_list_card_element_widget.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class PaymentMethodListCard extends StatelessWidget {
  final bool isSelected;
  final GestureTapCallback? onTap;
  final String title;
  final String icon;
  final bool isPngIcon;
  final bool isFirst;
  const PaymentMethodListCard(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.title,
      required this.icon,
      this.isFirst = false,
      required this.isPngIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isFirst ? 15 : 7.5, bottom: 7.5),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            GlobalSvgIcon(icon: isSelected ? selectIcon : selectWhiteIcon),
            const SizedBox(
              width: 10,
            ),
            PaymentMethodListCardElementWidget(
                title: title,
                icon: icon,
                borderColor: isSelected ? selectionGreen : null,
                isPngIcon: isPngIcon),
          ],
        ),
      ),
    );
  }
}
