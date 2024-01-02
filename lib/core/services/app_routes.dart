import 'package:flutter/material.dart';
import 'package:tollhopper/features/checkout/checkout_page.dart';
import 'package:tollhopper/features/contract_information/contract_information_page.dart';
import 'package:tollhopper/features/faq/faq_page.dart';
import 'package:tollhopper/features/home/home_screen.dart';
import 'package:tollhopper/features/imprint/imprint_page.dart';
import 'package:tollhopper/features/license_platform_information/license_platfrom_information_page.dart';
import 'package:tollhopper/features/login/login_page.dart';
import 'package:tollhopper/features/my_vignettes/my_vignettes_page.dart';
import 'package:tollhopper/features/news_details/news_details_screen.dart';
import 'package:tollhopper/features/news_tab/domain/usecases/get_specific_news_use_case.dart';
import 'package:tollhopper/features/order_summary/order_summary_page.dart';
import 'package:tollhopper/features/payment_method/payment_method_page.dart';
import 'package:tollhopper/features/registre/registre_page.dart';
import 'package:tollhopper/features/reset_password/reset_password_page.dart';
import 'package:tollhopper/features/settings/settings_page.dart';
import 'package:tollhopper/features/splash_screen/splash_screen_page.dart';
import 'package:tollhopper/features/user_profile/user_profile.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';

const String splashScreen = '/';
const String settingsPage = 'settings';
const String loginPage = 'login';
const String registerPage = 'register';
const String homePage = 'homePage';
const String licensePlatformInformation = 'licensePlatformInformation';
const String contactInformationPage = 'contactInformationPage';
const String paymentMethode = 'paymentMethode';
const String checkoutPage = 'checkoutPage';
const String orderSummaryPage = 'orderSummaryPage';
const String myVignettes = 'myVignettes';
const String userProfile = 'userProfile';
const String resetPassword = 'resetPassword';
const String newsDetail = 'news_detail';
const String imprintPage = 'imprint';
const String faqPage = 'faq';

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreenPage());
    // case settingsPage:
    //   return MaterialPageRoute(builder: (context) => const SettingPage());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case registerPage:
      final RegisterPageParams params =
          settings.arguments as RegisterPageParams;
      return MaterialPageRoute(
        builder: (context) => RegisterPage(
          showSkip: params.showSkip,
        ),
      );
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomeScreenPage());
    case contactInformationPage:
      final ContactInformationParams params =
          settings.arguments as ContactInformationParams;
      return MaterialPageRoute(
        builder: (context) => ContactInformation(
          isConnected: params.isConnected,
          token: params.token,
          licencePate: params.licencePate,
          countryLicencePate: params.countryLicencePate,
          licencePateRegEx: params.licencePateRegEx,
        ),
      );
    case paymentMethode:
      PaymentMethodeParams params = settings.arguments as PaymentMethodeParams;
      return MaterialPageRoute(
        builder: (context) => PaymentMethodePage(
          token: params.token,
          userModel: params.userModel,
          licencePate: params.licencePate,
          countryLicencePate: params.countryLicencePate,
          totalAmount: params.totalAmount,
          cart: params.cart,
          pateLicenceRegEx: params.licencePateRegEx,
        ),
      );
    case checkoutPage:
      CheckoutPageParams params = settings.arguments as CheckoutPageParams;
      return MaterialPageRoute(
        builder: (context) => CheckoutPage(
          licencePate: params.licencePate,
          token: params.token,
          userModel: params.userModel,
          countryLicencePate: params.countryLicencePate,
          licencePateRegEx: params.licencePateRegEx,
        ),
      );
    case licensePlatformInformation:
      return MaterialPageRoute(
          builder: (context) => const LicensePlatformInformationPage());
    case orderSummaryPage:
      OrderSummaryParams params = settings.arguments as OrderSummaryParams;
      return MaterialPageRoute(
        builder: (context) => OrderSummaryPage(
          userModel: params.userModel,
          cart: params.cart,
          pateLicence: params.licencePate,
          totalAmount: params.totalAmount,
        ),
      );
    case myVignettes:
      return MaterialPageRoute(builder: (context) => const MyVignettesPage());
    case userProfile:
      AccountSettingsParams params =
          settings.arguments as AccountSettingsParams;
      return MaterialPageRoute(
        builder: (context) =>
            UserProfilePage(isUserConnected: params.isUserConnected),
      );
    case resetPassword:
      return MaterialPageRoute(builder: (context) => const ResetPasswordPage());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingPage());
    case newsDetail:
      GetSpecificNewsParam params = settings.arguments as GetSpecificNewsParam;
      return MaterialPageRoute(
        builder: (context) => NewsDetailsScreen(
          id: params.id,
          locale: params.locale,
        ),
      );
    case imprintPage:
      return MaterialPageRoute(builder: (context) => const ImprintPage());
    case faqPage:
      return MaterialPageRoute(builder: (context) => const FAQPage());
    default:
      throw ('this route name does not exist');
  }
}
