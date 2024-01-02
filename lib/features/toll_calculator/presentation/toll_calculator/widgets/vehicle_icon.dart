import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/icons/svg_icon_with_rouned_background.dart';
import 'package:tollhopper/global/theme/themes.dart';

class VehicleIcon extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final GestureTapCallback? onTap;
  const VehicleIcon(
      {Key? key,
      required this.isSelected,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgIconWithRoundBackground(
        icon: icon,
        height: 20,
        width: 30,
        iconPadding: 12,
        hasBorder: !isSelected,
        forVehicule: true,
        color: isSelected ? selectedIconColor : checkBoxTextColor,
        backgroundColor: isSelected ? appPrimaryColor : globalBackgroundColor,
      ),
    );
  }
}
