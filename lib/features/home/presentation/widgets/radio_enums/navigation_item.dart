import 'package:easy_localization/easy_localization.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

enum NavigationItemEnum {
  home,
  vignette,
  calculator,
  news,
  cart,
}

extension NavigationItemEnumExtension on NavigationItemEnum {
  String get title {
    switch (this) {
      case NavigationItemEnum.home:
        return LocaleKeys.home_home_bar.tr();
      case NavigationItemEnum.vignette:
        return LocaleKeys.home_vignette.tr();
      case NavigationItemEnum.cart:
        return LocaleKeys.home_cart.tr();
      case NavigationItemEnum.calculator:
        return LocaleKeys.home_calculator.tr();
      case NavigationItemEnum.news:
        return LocaleKeys.home_news.tr();
    }
  }

  //?return svg icon
  String get icon {
    switch (this) {
      case NavigationItemEnum.home:
        return homeIcon;
      case NavigationItemEnum.vignette:
        return vignetteIcon;
      case NavigationItemEnum.cart:
        return cartIcon;
      case NavigationItemEnum.calculator:
        return tollCalculatorIcon;
      case NavigationItemEnum.news:
        return newsIcon;
    }
  }

  String get selectedIcon {
    switch (this) {
      case NavigationItemEnum.home:
        return homeBoldIcon;
      case NavigationItemEnum.vignette:
        return vignetteBoldIcon;
      case NavigationItemEnum.cart:
        return cartBoldIcon;
      case NavigationItemEnum.calculator:
        return tollCalculatorBoldIcon;
      case NavigationItemEnum.news:
        return newsBoldIcon;
    }
  }
}
