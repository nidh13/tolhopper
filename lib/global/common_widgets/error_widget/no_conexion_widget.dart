import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class NoConnexionWidget extends StatelessWidget {
  final GestureTapCallback? tryAgain;
  final IconData icon;
  final String text;
  const NoConnexionWidget({
    Key? key,
    required this.tryAgain,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: labelBlackColor,
          size: 50,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              LocaleKeys.server_internet_exception.tr(),
              textAlign: TextAlign.center,
              style: context.theme.textTheme.headline5
                  ?.copyWith(color: buttonDarkTextColor),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: tryAgain,
          child: Text(
            LocaleKeys.server_try_again.tr(),
            style: context.theme.textTheme.headline3
                ?.copyWith(color: buttonDarkTextColor),
          ),
        )
      ],
    );
  }
}
