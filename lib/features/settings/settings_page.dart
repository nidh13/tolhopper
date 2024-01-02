import 'package:flutter/material.dart';
import 'package:tollhopper/features/settings/presentation/settings_ui.dart';
import 'package:tollhopper/global/translation/supported_language.dart';
import 'package:tollhopper/global/utils/functions.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SupportedLanguageEasyLocalization? language;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    language = getSupportedLanguageEasyLocalizationFromString(
        getLocaleLanguageCode(context));
    return SettingUi(
      backButton: () => backButton(context),
      language: language,
      changeLanguage: (value) => changeAppLanguage(context, value),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }
}
