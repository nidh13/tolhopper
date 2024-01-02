import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class AppDrawerLogoutWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const AppDrawerLogoutWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const GlobalSvgIcon(icon: logOutIcon),
          const SizedBox(
            width: 10,
          ),
          Text(
            LocaleKeys.drawer_sign_out.tr(),
            style: theme.textTheme.headline3?.copyWith(
                color: redErrorLoginInputColor, fontSize: 16, height: 1.46),
          ),
        ],
      ),
    );
  }
}
