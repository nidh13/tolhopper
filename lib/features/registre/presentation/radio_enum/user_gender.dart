import 'package:easy_localization/easy_localization.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

enum UserGender {
  noChoice,
  male,
  female,
}

extension UserGenderExtension on UserGender {
  String get title {
    switch (this) {
      case UserGender.male:
        return LocaleKeys.register_gender_male.tr();
      case UserGender.female:
        return LocaleKeys.register_gender_female.tr();
      case UserGender.noChoice:
        return LocaleKeys.register_gender_nothing.tr();
    }
  }

  String get toDataBase {
    switch (this) {
      case UserGender.male:
        return "Herr";
      case UserGender.female:
        return "Frau";
      case UserGender.noChoice:
        return "Enby";
    }
  }
}

UserGender getUserGenderFromString(String gender) => UserGender.values
    .firstWhere((f) => f.toDataBase == gender, orElse: () => UserGender.noChoice);
