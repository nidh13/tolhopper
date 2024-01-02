import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/luch_url_utils/luch_url_utils.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/translation/supported_language.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/const.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';
import 'package:tollhopper/global/utils/enums/product_type_enum.dart';
import 'package:url_launcher/url_launcher.dart';

String getTextWithAppCurrency(String? price) {
  if (price != null) {
    return price + " $appCurrency";
  }
  return "";
}

String displayTollPrice(String? price) {
  if (price != null) {
    return LocaleKeys.toll_selection_price_from.tr() +
        " " +
        formatPrice(price);
  }
  return "";
}

String getOptionTextWithSeparator(String? text) {
  if (text != null) {
    return " / " + text;
  }
  return "";
}

String checkoutText({required String title, required String? price}) {
  if (price != null) {
    return "$title ($price)";
  }
  return title;
}

String getPlateInformationTitle(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return "A";
  }
  if (countryCode?.code == germanyCode) {
    return "D";
  }
  if (countryCode?.code == czeChiaCode) {
    return "CZ";
  }
  if (countryCode?.code == denmarkCode) {
    return "DK";
  }
  if (countryCode?.code == romaniaCode) {
    return "RO";
  }
  if (countryCode?.code == slovakiaCode) {
    return "SK";
  }
  if (countryCode?.code == sloveniaCode) {
    return "SLO";
  }
  // new
  if (countryCode?.code == belgiumCode) {
    return "B";
  }
  if (countryCode?.code == bulgariaCode) {
    return "BG";
  }
  if (countryCode?.code == estoniaCode) {
    return "EST";
  }
  if (countryCode?.code == croatiaCode) {
    return "HR";
  }
  if (countryCode?.code == italyCode) {
    return "I";
  }
  if (countryCode?.code == irelandCode) {
    return "IRL";
  }
  if (countryCode?.code == greeceCode) {
    return "GR";
  }
  if (countryCode?.code == franceCode) {
    return "F";
  }
  if (countryCode?.code == finlandCode) {
    return "FIN";
  }
  if (countryCode?.code == swedenCode) {
    return "S";
  }
  if (countryCode?.code == spainCode) {
    return "E";
  }
  if (countryCode?.code == portugalCode) {
    return "P";
  }
  if (countryCode?.code == netherlandCode) {
    return "NL";
  }
  if (countryCode?.code == maltaCode) {
    return "M";
  }
  if (countryCode?.code == luxembourgCode) {
    return "L";
  }
  if (countryCode?.code == lithuaniaCode) {
    return "LT";
  }
  if (countryCode?.code == latviaCode) {
    return "LV";
  }
  return "";
}

String getPlateInformationFirstHint(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return "B";
  }
  if (countryCode?.code == germanyCode) {
    return "B";
  }
  if (countryCode?.code == czeChiaCode) {
    return "B";
  }
  if (countryCode?.code == denmarkCode) {
    return "AB";
  }
  if (countryCode?.code == romaniaCode) {
    return "AB";
  }
  if (countryCode?.code == slovakiaCode) {
    return "AB";
  }
  if (countryCode?.code == switzerlandCode) {
    return "B";
  }
  if (countryCode?.code == sloveniaCode) {
    return "AB";
  }
  // new
  if (countryCode?.code == belgiumCode) {
    return "1ABC123";
  }
  if (countryCode?.code == bulgariaCode) {
    return "CA1234XY";
  }
  if (countryCode?.code == estoniaCode) {
    return "423ABC";
  }
  if (countryCode?.code == croatiaCode) {
    return " AB123CD";
  }
  if (countryCode?.code == italyCode) {
    return "AB123CD";
  }
  if (countryCode?.code == irelandCode) {
    return "17W12345";
  }
  if (countryCode?.code == greeceCode) {
    return "AA123BB";
  }
  if (countryCode?.code == franceCode) {
    return "AA123BB";
  }
  if (countryCode?.code == finlandCode) {
    return "MNO321";
  }
  if (countryCode?.code == swedenCode) {
    return "ABC321";
  }
  if (countryCode?.code == spainCode) {
    return "5678ABC";
  }
  if (countryCode?.code == portugalCode) {
    return "1221AB";
  }
  if (countryCode?.code == netherlandCode) {
    return "X999X";
  }
  if (countryCode?.code == maltaCode) {
    return "ABC123";
  }
  if (countryCode?.code == luxembourgCode) {
    return "AB1234";
  }
  if (countryCode?.code == lithuaniaCode) {
    return "BCA987";
  }
  if (countryCode?.code == latviaCode) {
    return "AB";
  }
  return "";
}

String getPlateInformationSecondHint(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return "12345X";
  }
  if (countryCode?.code == germanyCode) {
    return "AB";
  }
  if (countryCode?.code == czeChiaCode) {
    return "1234";
  }
  if (countryCode?.code == denmarkCode) {
    return "12";
  }
  if (countryCode?.code == romaniaCode) {
    return "123";
  }
  if (countryCode?.code == slovakiaCode) {
    return "123AB";
  }
  if (countryCode?.code == switzerlandCode) {
    return "543210";
  }
  if (countryCode?.code == sloveniaCode) {
    return "BA";
  }
  if (countryCode?.code == latviaCode) {
    return "1234";
  }
  return "";
}

String getPlateInformationThirdHint(CountryCode? countryCode) {
  if (countryCode?.code == germanyCode) {
    return "1234";
  }
  if (countryCode?.code == denmarkCode) {
    return "345";
  }
  if (countryCode?.code == romaniaCode) {
    return "345";
  }
  if (countryCode?.code == sloveniaCode) {
    return "123";
  }
  return "";
}

int getPlateInformationFirstLength(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return 2;
  }
  if (countryCode?.code == germanyCode) {
    return 3;
  }
  if (countryCode?.code == czeChiaCode) {
    return 3;
  }
  if (countryCode?.code == denmarkCode) {
    return 2;
  }
  if (countryCode?.code == romaniaCode) {
    return 2;
  }
  if (countryCode?.code == slovakiaCode) {
    return 2;
  }
  if (countryCode?.code == switzerlandCode) {
    return 2;
  }
  if (countryCode?.code == sloveniaCode) {
    return 2;
  }
  if (countryCode?.code == latviaCode) {
    return 2;
  }
  return 1;
}

int getPlateInformationSecondLength(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return 6;
  }
  if (countryCode?.code == germanyCode) {
    return 3;
  }
  if (countryCode?.code == czeChiaCode) {
    return 4;
  }
  if (countryCode?.code == denmarkCode) {
    return 2;
  }
  if (countryCode?.code == romaniaCode) {
    return 3;
  }
  if (countryCode?.code == slovakiaCode) {
    return 5;
  }
  if (countryCode?.code == switzerlandCode) {
    return 6;
  }
  if (countryCode?.code == sloveniaCode) {
    return 2;
  }
  if (countryCode?.code == latviaCode) {
    return 4;
  }
  return 1;
}

int getPlateInformationThirdLength(CountryCode? countryCode) {
  if (countryCode?.code == germanyCode) {
    return 4;
  }
  if (countryCode?.code == denmarkCode) {
    return 3;
  }
  if (countryCode?.code == romaniaCode) {
    return 3;
  }
  if (countryCode?.code == sloveniaCode) {
    return 4;
  }
  return 1;
}

int getPateInformationInputNumber(CountryCode? countryCode) {
  if (countryCode?.code == germanyCode) {
    return 3;
  }
  if (countryCode?.code == austriaCode) {
    return 2;
  }
  if (countryCode?.code == czeChiaCode) {
    return 2;
  }
  if (countryCode?.code == denmarkCode) {
    return 3;
  }
  if (countryCode?.code == romaniaCode) {
    return 3;
  }
  if (countryCode?.code == slovakiaCode) {
    return 2;
  }
  if (countryCode?.code == switzerlandCode) {
    return 2;
  }
  if (countryCode?.code == sloveniaCode) {
    return 3;
  }
  // new
  if (countryCode?.code == belgiumCode) {
    return 1;
  }
  if (countryCode?.code == bulgariaCode) {
    return 1;
  }
  if (countryCode?.code == estoniaCode) {
    return 1;
  }
  if (countryCode?.code == croatiaCode) {
    return 1;
  }
  if (countryCode?.code == italyCode) {
    return 1;
  }
  if (countryCode?.code == irelandCode) {
    return 1;
  }
  if (countryCode?.code == greeceCode) {
    return 1;
  }
  if (countryCode?.code == franceCode) {
    return 1;
  }
  if (countryCode?.code == finlandCode) {
    return 1;
  }
  if (countryCode?.code == swedenCode) {
    return 1;
  }
  if (countryCode?.code == spainCode) {
    return 1;
  }
  if (countryCode?.code == portugalCode) {
    return 1;
  }
  if (countryCode?.code == netherlandCode) {
    return 1;
  }
  if (countryCode?.code == maltaCode) {
    return 1;
  }
  if (countryCode?.code == luxembourgCode) {
    return 1;
  }
  if (countryCode?.code == lithuaniaCode) {
    return 1;
  }
  if (countryCode?.code == latviaCode) {
    return 2;
  }
  return 0;
}

int getPlateInformationFirstInputFlex(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return 4;
  }
  if (countryCode?.code == germanyCode) {
    return 4;
  }
  if (countryCode?.code == czeChiaCode) {
    return 6;
  }
  if (countryCode?.code == latviaCode) {
    return 6;
  }
  if (countryCode?.code == denmarkCode) {
    return 4;
  }
  if (countryCode?.code == romaniaCode) {
    return 4;
  }
  if (countryCode?.code == slovakiaCode) {
    return 4;
  }
  if (countryCode?.code == switzerlandCode) {
    return 3;
  }
  if (countryCode?.code == sloveniaCode) {
    return 4;
  }
  return 1;
}

int getPlateInformationSecondInputFlex(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return 12;
  }
  if (countryCode?.code == germanyCode) {
    return 4;
  }
  if (countryCode?.code == czeChiaCode) {
    return 8;
  }
  if (countryCode?.code == latviaCode) {
    return 8;
  }
  if (countryCode?.code == denmarkCode) {
    return 4;
  }
  if (countryCode?.code == romaniaCode) {
    return 6;
  }
  if (countryCode?.code == slovakiaCode) {
    return 10;
  }
  if (countryCode?.code == switzerlandCode) {
    return 9;
  }
  if (countryCode?.code == sloveniaCode) {
    return 4;
  }
  return 1;
}

int getPlateInformationThirdInputFlex(CountryCode? countryCode) {
  if (countryCode?.code == austriaCode) {
    return 6;
  }
  if (countryCode?.code == germanyCode) {
    return 6;
  }
  if (countryCode?.code == czeChiaCode) {
    return 4;
  }
  if (countryCode?.code == denmarkCode) {
    return 6;
  }
  if (countryCode?.code == romaniaCode) {
    return 6;
  }
  if (countryCode?.code == slovakiaCode) {
    return 5;
  }
  if (countryCode?.code == switzerlandCode) {
    return 6;
  }
  if (countryCode?.code == sloveniaCode) {
    return 8;
  }
  return 1;
}

String addApiLanguageCode(String api, String languageCode) {
  return api + languageCode;
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return LocaleKeys.server_internal_exception.tr();
    case UndefinedCountryFailure:
      return LocaleKeys.server_no_route_text.tr();
    case ConnexionFailure:
      return LocaleKeys.server_internet_exception.tr();
    case WrongEmailOrPassword:
      return LocaleKeys.server_credentials_exception.tr();
    case UserExistFailure:
      return LocaleKeys.server_customer_exist_exception.tr();
    case UserNotExistFailure:
      return LocaleKeys.server_user_not_exist.tr();
    default:
      return LocaleKeys.server_unexpected_exception.tr();
  }
}

String getLocaleLanguageCode(BuildContext context) {
  final String locale =
      EasyLocalization.of(context)?.locale.languageCode ?? "en";
  // api accept DE EN
  return locale.toLowerCase();
}

void changeAppLanguage(
    BuildContext context, SupportedLanguageEasyLocalization language) {
  EasyLocalization.of(context)?.setLocale(Locale(describeEnum(language)));
}

String getAbgUrl(BuildContext context) {
  final language = getLocaleLanguageCode(context);
  return webUrl + "$language/agb";
}

double? checkDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

List<VignetteProduct> getListProductsByCountryCode(
    {required CountryCode countryCode,
    required List<VignetteProduct> allProducts}) {
  return allProducts
      .where((element) => element.countryCode == countryCode.code)
      .toList();
}

// List<VignetteProduct> getListProductsByTypeAndCarType(
//     {required ProductTypeEnum productTypeEnum,
//     required List<VignetteProduct> allProducts,
//     required VehicleEnum vehicleEnum}) {
//   return allProducts
//       .where((element) => (element.prices != null)
//           ? element.prices!
//               .any((price) => price.vehicle?.type == vehicleEnum.name)
//           : false)
//       .toList();
// }

List<VignetteProduct> getListVignetteByTypeAnCountryCode({
  required ProductTypeEnum productTypeEnum,
  required List<VignetteProduct> allProducts,
  required CountryCode countryCode,
}) {
  return allProducts
      .where((element) =>
          element.type == productTypeEnum.name &&
          element.countryCode == countryCode.code)
      .toList();
}

Map<String, dynamic> getRoutesMapFromParams(
    {required String startText,
    required String destinationText,
    required AppLocation? startLocation,
    required AppLocation? destinationLocation}) {
  if (startLocation != null && destinationLocation != null) {
    return {
      "from": {"lat": startLocation.latitude, "lng": startLocation.longitude},
      "to": {
        "lat": destinationLocation.latitude,
        "lng": destinationLocation.longitude
      }
    };
  } else if (startLocation != null && destinationLocation == null) {
    return {
      "from": {"lat": startLocation.latitude, "lng": startLocation.longitude},
      "to": {"address": destinationText}
    };
  } else if (startLocation == null && destinationLocation != null) {
    return {
      "from": {"address": startText},
      "to": {
        "lat": destinationLocation.latitude,
        "lng": destinationLocation.longitude
      }
    };
  }
  return {
    "from": {"address": startText},
    "to": {"address": destinationText}
  };
}

Set<Polyline> decodeGooglePolyLineString(String polyLine) {
  PolylinePoints polylinePoints = PolylinePoints();
  final points = polylinePoints.decodePolyline(polyLine);
  final _polylines = {
    Polyline(
      polylineId: const PolylineId('direction_polyline'),
      color: polyLineColor,
      width: 5,
      points: points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
    )
  };
  return _polylines;
}

void lunchUrlTerms(BuildContext context, LaunchMode launchMode) async {
  final url = getAbgUrl(context);
  URLUtils.launchURL(url, launchMode);
}

String getVehiclesIdFromType(String type, List<PriceVehicle> listVehicles) {
  final list = listVehicles.where((element) => element.type == type).toList();
  return list.isNotEmpty ? list[0].id ?? "" : "";
}

String convertDateFormat(String dateString) {
  // Parse the input date string into a DateTime object using the original format
  DateTime dateTime = DateFormat('dd.MM.yyyy').parse(dateString);
  // Format the DateTime object into the desired format
  String formattedDateTime = '${dateTime.year.toString().padLeft(4, '0')}-'
      '${dateTime.month.toString().padLeft(2, '0')}-'
      '${dateTime.day.toString().padLeft(2, '0')}T'
      '${dateTime.hour.toString().padLeft(2, '0')}:'
      '${dateTime.minute.toString().padLeft(2, '0')}:'
      '${dateTime.second.toString().padLeft(2, '0')}.'
      '000Z';

  return formattedDateTime;
}

String formatDateToApi(DateTime dateTime) {
  String formattedDateTime = '${dateTime.year.toString().padLeft(4, '0')}-'
      '${dateTime.month.toString().padLeft(2, '0')}-'
      '${dateTime.day.toString().padLeft(2, '0')}T'
      '${dateTime.hour.toString().padLeft(2, '0')}:'
      '${dateTime.minute.toString().padLeft(2, '0')}:'
      '${dateTime.second.toString().padLeft(2, '0')}.'
      '000Z';

  return formattedDateTime;
}

bool endDateIsBiggerThanStartDate(
    {required String startDate, required String endDate}) {
  final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
  final DateTime parsedStartDate = dateFormat.parse(startDate);
  final DateTime parsedEndDate = dateFormat.parse(endDate);
  return parsedEndDate.isAfter(parsedStartDate);
}

Future<void> selectSomethingDialog(BuildContext context) async {
  await DialogUtils.showOKDialog(
      context: context,
      title: LocaleKeys.toll_selection_dialog_title.tr(),
      confirmButtonText: LocaleKeys.toll_selection_confirm_dialog.tr(),
      content: LocaleKeys.toll_selection_select_something.tr());
}

unFocusAppKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String correctCountryCode(String packageCountryCode) {
  if (packageCountryCode == "AX") {
    return "FI";
  }
  if (packageCountryCode == "BV") {
    return "NO";
  }
  if (packageCountryCode == "GG") {
    return "GB";
  }

  return packageCountryCode;
}

String getCustomerIdFromBackendToken(String token) {
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  return decodedToken['customer']['id'];
}

// 12.10.2023 => 12 Oct 2023
String convertDateWithDotsToAbbreviatedMonth({
  required String? originalDate,
  required String locale,
}) {
  if (originalDate != null) {
    initializeDateFormatting(locale, null);

    DateTime parsedDate = DateFormat("dd.MM.yyyy", locale).parse(originalDate);
    String formattedDate = DateFormat("dd MMM yyyy", locale).format(parsedDate);
    return formattedDate;
  }
  return '';
}

String formatDateTimeToString({
  required DateTime dateTime,
  required String pattern,
  required String locale,
}) {
  return DateFormat(pattern, locale).format(dateTime);
}

String formatStringDate({
  required String dateString,
  required String pattern,
  required String locale,
}) {
  try {
    DateTime parsedDate = DateTime.parse(dateString);
    String formattedDate = DateFormat(pattern, locale).format(parsedDate);

    return formattedDate;
  } catch (e) {
    return '';
  }
}

String getInputField(String licensePlate, int index) {
  try {
    return licensePlate.split('-')[index];
  } on RangeError {
    return "";
  }
}

String formatPrice(String priceStr) {
  double price = double.tryParse(priceStr) ?? 0.0;
  var euroFormatter = NumberFormat('#,##0.00 $appCurrency', 'de');

  return euroFormatter.format(price);
}

String formatPriceNoCurrency(String? priceStr) {
  if(priceStr != null){
    double price = double.tryParse(priceStr) ?? 0.0;
    var euroFormatter = NumberFormat('#,##0.00', 'de');

    return euroFormatter.format(price);
  }
  return "";

}

DateTime addDuration(String date, String durationStr) {
  DateTime startDate = DateTime.parse(date);

  final RegExp regex = RegExp(r"(\d+)([ymd]?)");

  final match = regex.firstMatch(durationStr);

  if (match == null) {
    throw const FormatException("Invalid duration format");
  }

  final int value = int.parse(match.group(1)!);
  final String unit = match.group(2) ?? 'd';

  switch (unit) {
    case 'd':
      return startDate.add(Duration(days: value));
    case 'm':
      return DateTime(startDate.year, startDate.month + value, startDate.day);
    case 'y':
      return DateTime(startDate.year + value, startDate.month, startDate.day);
    default:
      throw const FormatException("Invalid duration unit");
  }
}
