import 'package:flutter/material.dart';
import 'package:tollhopper/features/toll_calculator/presentation/route_trajectory/widgets/trajectory_text.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/common_widgets/texts/common_text_with_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class TrajectoryItemCard extends StatelessWidget {
  final bool isSelected;
  final String routeReference;
  final String countryStart;
  final String countryDestination;
  final String duration;
  final String distance;
  final VoidCallback? seeOnMap;
  const TrajectoryItemCard(
      {Key? key,
      required this.isSelected,
      required this.routeReference,
      required this.countryDestination,
      required this.duration,
      required this.countryStart,
      required this.seeOnMap,
      required this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? selectionGreen : trajectoryCardBorderColor,
            width: 0.7,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CommonTextWithIcon(
                          icon: positionIconOutlined,
                          title: routeReference,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        (countryDestination.isEmpty && countryStart.isEmpty)
                            ? const SizedBox()
                            : Flexible(
                                child: TrajectoryText(
                                  countryDestination: countryDestination,
                                  countryStart: countryStart,
                                ),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: seeOnMap,
                      child: const GlobalSvgIcon(
                        icon: googleMapIcon,
                        height: 25,
                        width: 25,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CommonTextWithIcon(
                    icon: drawIcon,
                    title: duration,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CommonTextWithIcon(
                    icon: positionIconOutlined,
                    title: distance,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
