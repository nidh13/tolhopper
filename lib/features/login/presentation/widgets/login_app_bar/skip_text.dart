import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class SkipText extends StatefulWidget {
  const SkipText({Key? key}) : super(key: key);

  @override
  State<SkipText> createState() => _SkipTextState();
}

class _SkipTextState extends State<SkipText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.skip_text.tr(),
      style: skipTextStyle,
    );
  }
}
