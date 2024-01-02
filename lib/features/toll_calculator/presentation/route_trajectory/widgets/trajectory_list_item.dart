import 'package:flutter/material.dart';
import 'package:tollhopper/features/toll_calculator/presentation/route_trajectory/widgets/trajectory_item_card.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';

class TrajectoryListItem extends StatelessWidget {
  final bool isSelected;
  final GestureTapCallback? onTap;
  final String routeReference;
  final String duration;
  final String distance;
  final String countryDestination;
  final String countryStart;
  final VoidCallback? seeOnMap;
  const TrajectoryListItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.duration,
    required this.distance,
    required this.countryStart,
    required this.countryDestination,
    required this.seeOnMap,
    required this.routeReference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            GlobalSvgIcon(icon: isSelected ? selectIcon : selectWhiteIcon),
            const SizedBox(
              width: 10,
            ),
            TrajectoryItemCard(
                isSelected: isSelected,
                routeReference: routeReference,
                duration: duration,
                countryDestination: countryDestination,
                seeOnMap: seeOnMap,
                distance: distance,
                countryStart: countryStart),
          ],
        ),
      ),
    );
  }
}
