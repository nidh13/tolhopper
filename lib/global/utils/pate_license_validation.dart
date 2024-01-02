import 'package:tollhopper/global/utils/country_app.dart';

RegExp albaniaRegex =
    RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{3}([A-Z]{1,2}|[a-z]{1,2})$');
RegExp andorraRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2,4}[a-z]{0,2}$');
RegExp armeniaRegex =
    RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}([A-Z]{1,2}|[a-z]{1,2})\d{1,3}$');
RegExp austriaRegex =
    RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})-\d{5}([A-Z]{1}|[a-z]{1})$');
RegExp azerbaijanRegex =
    RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}([A-Z]{1,2}|[a-z]{1,2})\d{1,2}$');
RegExp belarusRegex = RegExp(r'^[0-9]{4} ([A-Z]{2}|[a-z]{2})[0-9]{1,4}$');
RegExp belgiumRegex = RegExp(r'^1([A-Z]{3}|[a-z]{3})\d{3}$');
RegExp bosniaRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{1,2}\d{1,5}$');
RegExp bulgariaRegex =
    RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{4}([A-Z]{2}|[a-z]{2})$');
RegExp croatiaRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}\d{1,4}$');
RegExp cyprusRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{4}[a-z]{0,2}$');
RegExp czechRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}\d{2,3}$');
RegExp denmarkRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})[0-9]{5}$');
RegExp estonieRegex = RegExp(r'^\d{3}([A-Z]{3}|[a-z]{3})$');
RegExp finlandRegex = RegExp(r'^([A-Z]{1,3}|[a-z]{1,3})\d{2,3}$');
RegExp franceRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{3}([A-Z]{2}|[a-z]{2})$');
RegExp georgiaRegex =
    RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}([A-Z]{1,2}|[a-z]{1,2})\d{1,2}$');
//RegExp germanyRegex = RegExp(r'^[a-zA-Z]{1,3}-[a-zA-Z]{1,2}\d{1,4}$');
RegExp germanyRegex = RegExp(r'^[A-ZÄÖÜ]{1,3}-?[A-Z]{0,2}\d{1,4}H?$');

RegExp greeceRegex = RegExp(r'^([A-Z]{3}|[a-z]{3})\d{4}$');
RegExp hungaryRegex = RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{4}$');
RegExp icelandRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2,3}$');
RegExp irelandRegex = RegExp(r'^\d{1,2}([A-Z]{1,2}|[a-z]{1,2})\d{1,6}$');
RegExp italyRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{3}([A-Z]{2}|[a-z]{2})$');
RegExp kazakhstanRegex = RegExp(r'^\d{2}-([A-Z]{2}|[a-z]{2})\d{2}$');
RegExp latviaRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{4}$');
RegExp liechtensteinRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}\d{2,6}$');
RegExp lithuaniaRegex = RegExp(r'^([A-Z]{3}|[a-z]{3})\d{3}$');
RegExp luxembourgRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{4}$');
RegExp macedoniaRegex =
    RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{2}([A-Z]{1,2}|[a-z]{1,2})$');
RegExp maltaRegex = RegExp(r'^([A-Z]{3}|[a-z]{3})\d{3}$');
RegExp moldovaRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}([A-Z]{2}|[a-z]{2})$');
RegExp monacoRegex = RegExp(r'^\d{1,2}-([A-Z]{1,2}|[a-z]{1,2})-\d{2,4}$');
RegExp montenegroRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{1,2}\d{1,4}$');
RegExp netherlandsRegex =
    RegExp(r'^([A-Z]{1}|[a-z]{1})\d{3}([A-Z]{2}|[a-z]{2})$');
RegExp norwayRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2,5}$');
RegExp polandRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{1,2}\d{1,3}$');
RegExp portugalRegex = RegExp(r'^\d{2}\d{2}([A-Z]{2}|[a-z]{2})$');
RegExp romaniaRegex = RegExp(
    r'^(AB|ab|AG|ag|AR|ar|B|b|BC|bc|BH|bh|BN|bn|BR|br|BT|bt|BV|bv|BZ|bz|CJ|cj|CL|cl|CS|cs|CT|ct|CV|cv|DB|db|DJ|dj|GJ|gj|GL|gl|GR|gr|HD|hd|HR|hr|IF|if|IL|il|IS|is|MH|mh|MM|mm|MS|ms|NT|nt|OT|ot|PH|ph|SB|sb|SJ|sj|SM|sm|SV|sv|TL|tl|TM|tm|TR|tr|VL|vl|VN|vn|VS|vs)\d{2,3}([A-Z]{3}|[a-z]{3})$');
RegExp russiaRegex = RegExp(r'^\d{2}\d{2}\d{2,3}$');
RegExp sanMarinoRegex = RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{3,4}$');
RegExp serbiaRegex =
    RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{1,4}([A-Z]{1,2}|[a-z]{1,2})$');
RegExp slovakiaRegex =
    RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2}\d{1,2}([A-Z]{2}|[a-z]{2})$');
RegExp sloveniaRegex = RegExp(
    r'^(CE|ce|GO|go|KK|kk|KP|kp|KR|kr|LJ|lj|MB|mb|MS|ms|NM|nm|PO|po|sg|SG)([A-Z]{2}|[a-z]{2})\d{3}$');
RegExp spainRegex = RegExp(r'^\d{4}([A-Z]{1,3}|[a-z]{1,3})$');
RegExp swedenRegex = RegExp(r'^([A-Z]{1,3}|[a-z]{1,3})\d{3}$');
RegExp switzerlandRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2,6}$');
RegExp turkeyRegex =
    RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2} ([A-Z]{1,3}|[a-z]{1,3}) \d{2,4}$');
RegExp ukraineRegex = RegExp(r'^([A-Z]{2}|[a-z]{2})\d{4}([A-Z]{2}|[a-z]{2})$');
RegExp englandRegex =
    RegExp(r'^([A-Z]{2}|[a-z]{2})\d{2} ([A-Z]{1,2}|[a-z]{1,2})\d{1,2}$');
RegExp vaticanRegex = RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{1,4}[a-z]{0,2}$');
RegExp israelRegex = RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{3}\d{2}$');
RegExp iranRegex = RegExp(r'^\d{2}([A-Z]{1,2}|[a-z]{1,2})\d{1,5}$');
RegExp kuwaitRegex =
    RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{1,4}([A-Z]{1,2}|[a-z]{1,2})$');
RegExp lebanonRegex = RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{4}$');
RegExp marocRegex = RegExp(r'^([A-Z]{1,2}|[a-z]{1,2})\d{2}\d{2}\d{2}$');
RegExp emiratesRegex = RegExp(r'^[a-z]{3}\d{5}$');
RegExp egyptRegex = RegExp(r'^(?=.*\d)[a-zA-Z\d]*$');

RegExp? getRegexByCountryCode(String countryCode) {
  switch (countryCode) {
    case "AL":
      return albaniaRegex;
    case "AD":
      return andorraRegex;
    case "AM":
      return armeniaRegex;
    case "AT":
      return austriaRegex;
    case "AZ":
      return azerbaijanRegex;
    case "BY":
      return belarusRegex;
    case "BE":
      return belgiumRegex;
    case "BA":
      return bosniaRegex;
    case "BG":
      return bulgariaRegex;
    case "HR":
      return croatiaRegex;
    case "CY":
      return cyprusRegex;
    case "CZ":
      return czechRegex;
    case "DK":
      return denmarkRegex;
    case "EE":
      return estonieRegex;

    /// the finland iso code is FI by in package AX
    case "AX":
      return finlandRegex;
    case "FR":
      return franceRegex;
    case "GE":
      return georgiaRegex;
    case "DE":
      return germanyRegex;
    case "GR":
      return greeceRegex;
    case "HU":
      return hungaryRegex;
    case "IS":
      return icelandRegex;
    case "IE":
      return irelandRegex;
    case "IT":
      return italyRegex;
    case "KZ":
      return kazakhstanRegex;
    case "LV":
      return latviaRegex;
    case "LI":
      return liechtensteinRegex;
    case "LT":
      return lithuaniaRegex;
    case "LU":
      return luxembourgRegex;
    case "MK":
      return macedoniaRegex;
    case "MT":
      return maltaRegex;
    case "MD":
      return moldovaRegex;
    case "MC":
      return monacoRegex;
    case "ME":
      return montenegroRegex;
    case "NL":
      return netherlandsRegex;

    /// country iso code 2 is NO BV for package
    case "BV":
      return norwayRegex;
    case "PL":
      return polandRegex;
    case "PT":
      return portugalRegex;
    case "RO":
      return romaniaRegex;

    /// RU is russia iso code KZ for package
    // case "KZ":
    //   return russiaRegex;
    case "SM":
      return sanMarinoRegex;
    case "RS":
      return serbiaRegex;
    case "SK":
      return slovakiaRegex;
    case "SI":
      return sloveniaRegex;
    case "ES":
      return spainRegex;
    case "SE":
      return swedenRegex;
    case "CH":
      return switzerlandRegex;
    case "TR":
      return turkeyRegex;
    case "UA":
      return ukraineRegex;

    ///GB IS the england code GG for package
    case "GG":
      return englandRegex;
    case "VA":
      return vaticanRegex;
    case "IL":
      return israelRegex;
    case "IR":
      return iranRegex;
    case "KW":
      return kuwaitRegex;
    case "LB":
      return lebanonRegex;
    case "MA":
      return marocRegex;
    case "AE":
      return emiratesRegex;
    case "EG":
      return egyptRegex;
    default:
      return germanyRegex;
  }
}

bool isValidCountryPateLicense({
  required String firstInput,
  required String secondInput,
  required String lastInput,
  required String countryCode,
}) {
  String fullText = "";
  fullText = getFullTextPateLicense(
    firstInput: firstInput,
    secondInput: secondInput,
    lastInput: lastInput,
    countryCode: countryCode,
  );
  RegExp? countryRegex = getRegexByCountryCode(countryCode);
  if (countryRegex != null) {
    return countryRegex.hasMatch(fullText);
  } else {
    return fullText.isNotEmpty;
  }
}

String getFullTextPateLicense({
  required String firstInput,
  required String secondInput,
  required String lastInput,
  required String countryCode,
}) {
  String fullText = "";
  if (countryCode == germanyCode || countryCode == austriaCode) {
    fullText = firstInput + "-" + secondInput + lastInput;
  } else {
    fullText = firstInput + secondInput + lastInput;
  }
  return fullText;
}

String getFullTextPateLicenseRegEx({
  required String firstInput,
  required String secondInput,
  required String lastInput,
}) {
  String fullText = firstInput;
  if (secondInput.isNotEmpty) {
    fullText = fullText + '-' + secondInput;
  }
  if (lastInput.isNotEmpty) {
    fullText = fullText + '-' + lastInput;
  }
  return fullText;
}
