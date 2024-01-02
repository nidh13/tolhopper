import 'package:easy_localization/easy_localization.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

enum AppDrawerEnum {
  account,
  vignettes,
  news,
  payment,
  notification,
  settings,
  imprint,
  support,
  termsConditions,
  privacy,
  faq,
}

List<AppDrawerEnum> listAppDrawerEnumAvailable = [
  AppDrawerEnum.account,
  AppDrawerEnum.vignettes,
  AppDrawerEnum.news,
  AppDrawerEnum.settings,
];

extension AppDrawerEnumExtension on AppDrawerEnum {
  String get labelName {
    switch (this) {
      case AppDrawerEnum.account:
        return LocaleKeys.drawer_account_settings.tr();
      case AppDrawerEnum.vignettes:
        return LocaleKeys.drawer_vignette.tr();
      case AppDrawerEnum.news:
        return LocaleKeys.news_app_bar_title.tr();
      case AppDrawerEnum.payment:
        return LocaleKeys.drawer_payment.tr();
      case AppDrawerEnum.notification:
        return LocaleKeys.drawer_notification.tr();
      case AppDrawerEnum.settings:
        return LocaleKeys.drawer_settings.tr();
      case AppDrawerEnum.imprint:
        return LocaleKeys.drawer_imprint.tr();
      case AppDrawerEnum.support:
        return LocaleKeys.drawer_support.tr();
      case AppDrawerEnum.termsConditions:
        return LocaleKeys.drawer_term_conditions.tr();
      case AppDrawerEnum.privacy:
        return LocaleKeys.drawer_privacy.tr();
      case AppDrawerEnum.faq:
        return "FAQ";
    }
  }

  String get icon {
    switch (this) {
      case AppDrawerEnum.account:
        return myAccountDrawerIcon;
      case AppDrawerEnum.vignettes:
        return vignetteIcon;
      case AppDrawerEnum.news:
        return newsIcon;
      case AppDrawerEnum.payment:
        return cardIcon;
      case AppDrawerEnum.notification:
        return notificationIcon;
      case AppDrawerEnum.settings:
        return settingIcon;
      case AppDrawerEnum.imprint:
        return paintBucketIcon;
      case AppDrawerEnum.support:
        return messageIcon;
      case AppDrawerEnum.termsConditions:
        return termConditionIcon;
      case AppDrawerEnum.privacy:
        return locDrawerIcon;
      case AppDrawerEnum.faq:
        return termConditionIcon;
    }
  }

  String get routes {
    switch (this) {
      case AppDrawerEnum.account:
        return userProfile;
      case AppDrawerEnum.vignettes:
        return "";
        return myVignettes;
      case AppDrawerEnum.news:
        return "";
      case AppDrawerEnum.payment:
        return "";
      case AppDrawerEnum.notification:
        return "";
      case AppDrawerEnum.settings:
        return settingsPage;
      case AppDrawerEnum.imprint:
        return imprintPage;
      case AppDrawerEnum.support:
        return "";
      case AppDrawerEnum.termsConditions:
        return "";
      case AppDrawerEnum.privacy:
        return "";
      case AppDrawerEnum.faq:
        return faqPage;
    }
  }
}
