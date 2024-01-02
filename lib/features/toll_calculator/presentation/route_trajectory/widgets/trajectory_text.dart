import 'package:flutter/material.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class TrajectoryText extends StatelessWidget {
  final String countryStart;
  final String countryDestination;
  const TrajectoryText(
      {Key? key, required this.countryDestination, required this.countryStart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            countryStart,
            style: trajectoryTextStyle,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        const GlobalSvgIcon(
          icon: arrowIcon,
          color: checkBoxTextColor,
        ),
        const SizedBox(
          width: 2,
        ),
        Flexible(
          child: Text(
            countryDestination,
            style: trajectoryTextStyle,
          ),
        ),
      ],
    );
  }
}
