import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

enum SupportedLanguageEasyLocalization { en, de }

extension SupportedLanguageEasyLocalizationExtension
    on SupportedLanguageEasyLocalization {
  String get title {
    switch (this) {
      case SupportedLanguageEasyLocalization.en:
        return LocaleKeys.settings_english.tr();
      case SupportedLanguageEasyLocalization.de:
        return LocaleKeys.settings_german.tr();
    }
  }

  FlagsCode get flag {
    switch (this) {
      case SupportedLanguageEasyLocalization.en:
        return FlagsCode.GB;
      case SupportedLanguageEasyLocalization.de:
        return FlagsCode.DE;
    }
  }
}

SupportedLanguageEasyLocalization
    getSupportedLanguageEasyLocalizationFromString(String language) =>
        SupportedLanguageEasyLocalization.values.firstWhere(
            (f) => f.name == language,
            orElse: () => SupportedLanguageEasyLocalization.en);
