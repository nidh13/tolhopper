import 'package:flutter/material.dart';
import 'package:tollhopper/features/checkout/presentation/widget/general_information/titles/description_title.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/png_icon.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class DescriptionTextWithIcon extends StatelessWidget {
  final String title;
  final String icon;
  final String cardInformation;
  final bool isPngIcon;

  const DescriptionTextWithIcon({
    Key? key,
    required this.title,
    required this.icon,
    this.isPngIcon = false,
    required this.cardInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionBigTitle(text: title),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  isPngIcon
                      ? AppPngIcon(
                          path: icon,
                          height: 30,
                          width: 30,
                        )
                      : GlobalSvgIcon(
                          icon: icon,
                          height: 30,
                          width: 30,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    cardInformation,
                    style: theme.textTheme.headline2
                        ?.copyWith(fontSize: 13.71, color: back1),
                  ),
                ],
              ),
            ),
            const GlobalSvgIcon(icon: selectIcon),
          ],
        )
      ],
    );
  }
}
