import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class FreeTextContainer extends StatelessWidget {
  final bool comingSoon;
  const FreeTextContainer({
    Key? key,
    this.comingSoon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: freeToLLColor,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Text(
                comingSoon
                    ? LocaleKeys.not_available_product_coming_soon_title.tr()
                    : LocaleKeys.not_available_product_title.tr(),
                style: theme.textTheme.headline2?.copyWith(color: Colors.white),
              ),
              Text(
                comingSoon
                    ? LocaleKeys.not_available_product_coming_soon_text.tr()
                    : LocaleKeys.not_available_product_text.tr(),
                style: theme.textTheme.headline4?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
