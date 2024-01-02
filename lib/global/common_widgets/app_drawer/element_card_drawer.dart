import 'package:flutter/material.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class ElementCardDrawer extends StatelessWidget {
  final String icon;
  final String title;
  final GestureTapCallback? onTap;

  const ElementCardDrawer({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GlobalSvgIcon(
                    icon: icon,
                    color: blueTextColor,
                    height: 28,
                    width: 28,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.labelMedium,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: GlobalSvgIcon(
              icon: arrowDrawerIcon,
            ),
          )
        ],
      ),
    );
  }
}
