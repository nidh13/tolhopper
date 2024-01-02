import 'package:easy_localization/easy_localization.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

enum PaymentMethodEnum { creditCard, paypal,}
// klarna, sofort }

const List<PaymentMethodEnum> paymentMethodList = PaymentMethodEnum.values;

extension PaymentMethodExtension on PaymentMethodEnum {
  String get title {
    switch (this) {
      case PaymentMethodEnum.creditCard:
        return LocaleKeys.payment_method_credit_card.tr();
      case PaymentMethodEnum.paypal:
        return LocaleKeys.payment_method_paypal.tr();
      // case PaymentMethodEnum.klarna:
      //   return LocaleKeys.payment_method_klarna.tr();
      // case PaymentMethodEnum.sofort:
      //   return LocaleKeys.payment_method_sofort_uberweisung.tr();
    }
  }

  String get icon {
    switch (this) {
      case PaymentMethodEnum.creditCard:
        return masterCardIcon;
      case PaymentMethodEnum.paypal:
        return paypalIcon;
      // case PaymentMethodEnum.klarna:
      //   return klarnaIcon;
      // case PaymentMethodEnum.sofort:
      //   return sofortIcon;
    }
  }
  bool get isPngIcon{
    switch (this) {
      case PaymentMethodEnum.creditCard:
        return true;
      case PaymentMethodEnum.paypal:
        return false;
      // case PaymentMethodEnum.klarna:
      //   return true;
      // case PaymentMethodEnum.sofort:
      //   return true;
    }
  }
}
