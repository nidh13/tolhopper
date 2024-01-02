import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class AppDrawerLoginWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const AppDrawerLoginWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(
            Icons.login,
            color: blueTextColor,
            size: 28,
          ),
          const SizedBox(width: 10),
          Text(
            LocaleKeys.login_title.tr(),
            style: context.theme.textTheme.headline3
                ?.copyWith(color: blueTextColor, fontSize: 16, height: 1.46),
          ),
        ],
      ),
    );
  }
}
