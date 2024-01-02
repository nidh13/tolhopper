import 'package:flutter/material.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_title.dart';
import 'package:tollhopper/global/common_widgets/app_bars/svg_icon_with_action.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? onTap;
  final String title;
  final bool? hasBackButton;
  const CommonAppBar(
      {Key? key, this.onTap, required this.title, this.hasBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: homeAppBarBorderColor,
            width: 0.7,
          ),
        ),
      ),
      child: AppBar(
        elevation: 0,
        backgroundColor: globalBackgroundColor,
        centerTitle: true,
        title: CommonAppBarTitle(
          title: title,
        ),
        leading: hasBackButton == true
            ? SvgIconWithAction(
                onTap: onTap,
                icon: backIcon,
                color: blackAppBarTextColor,
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
