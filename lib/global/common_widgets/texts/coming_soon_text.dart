import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class ComingSoonText extends StatelessWidget {
  const ComingSoonText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        LocaleKeys.feature_coming_soon.tr(),
        style: theme.textTheme.headline3,
      ),
    );
  }
}
