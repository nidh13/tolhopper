import 'package:flutter/material.dart';
import 'package:tollhopper/global/utils/functions.dart';

class DefinedCountry {
  final int id;
  final String alpha2;
  final String alpha3;
  final String name;
  final String germaneName;
  bool hasTolls;
  bool hasVignettes;

  DefinedCountry({
    required this.id,
    required this.alpha2,
    required this.alpha3,
    required this.name,
    required this.germaneName,
    this.hasTolls = false,
    this.hasVignettes = true,
  });

  String getNameWithLanguageCode(BuildContext context) {
    final languageCode = getLocaleLanguageCode(context);
    if (languageCode == "de") {
      return germaneName;
    }
    return name;
  }
}

// you can complete  this if you need Kosovo Liechtenstein Monaco North Macedonia San Marino turkey
final List<DefinedCountry> europeEnglishCountries = [
  DefinedCountry(
    id: 8,
    alpha2: "al",
    alpha3: "alb",
    name: "Albania",
    germaneName: "Albanien",
  ),
  DefinedCountry(
    id: 20,
    alpha2: "ad",
    alpha3: "and",
    name: "Andorra",
    germaneName: "Andorra",
  ),
  DefinedCountry(
    id: 40,
    alpha2: "at",
    alpha3: "aut",
    name: "Austria",
    germaneName: "Österreich",
  ),
  DefinedCountry(
    id: 31,
    alpha2: "az",
    alpha3: "aze",
    name: "Azerbaijan",
    germaneName: "Aserbaidschan",
  ),
  DefinedCountry(
    id: 112,
    alpha2: "by",
    alpha3: "blr",
    name: "Belarus",
    germaneName: "Weißrussland",
  ),
  DefinedCountry(
    id: 56,
    alpha2: "be",
    alpha3: "bel",
    name: "Belgium",
    germaneName: "Belgien",
  ),
  DefinedCountry(
    id: 70,
    alpha2: "ba",
    alpha3: "bih",
    name: "Bosnia and Herzegovina",
    germaneName: "Bosnien und Herzegowina",
  ),
  DefinedCountry(
    id: 100,
    alpha2: "bg",
    alpha3: "bgr",
    name: "Bulgaria",
    germaneName: "Bulgarien",
  ),
  DefinedCountry(
    id: 191,
    alpha2: "hr",
    alpha3: "hrv",
    name: "Croatia",
    germaneName: "Kroatien",
  ),
  DefinedCountry(
    id: 196,
    alpha2: "cy",
    alpha3: "cyp",
    name: "Cyprus",
    germaneName: "Zypern",
  ),
  DefinedCountry(
    id: 203,
    alpha2: "cz",
    alpha3: "cze",
    name: "Czechia",
    germaneName: "Tschechien",
  ),
  DefinedCountry(
    id: 208,
    alpha2: "dk",
    alpha3: "dnk",
    name: "Denmark",
    germaneName: "Dänemark",
  ),
  DefinedCountry(
    id: 233,
    alpha2: "ee",
    alpha3: "est",
    name: "Estonia",
    germaneName: "Estland",
  ),
  DefinedCountry(
    id: 246,
    alpha2: "fi",
    alpha3: "fin",
    name: "Finland",
    germaneName: "Finnland",
  ),
  DefinedCountry(
    id: 250,
    alpha2: "fr",
    alpha3: "fra",
    name: "France",
    germaneName: "Frankreich",
  ),
  DefinedCountry(
    id: 276,
    alpha2: "de",
    alpha3: "deu",
    name: "Germany",
    germaneName: "Deutschland",
  ),
  DefinedCountry(
    id: 300,
    alpha2: "gr",
    alpha3: "grc",
    name: "Greece",
    germaneName: "Griechenland",
  ),
  DefinedCountry(
    id: 348,
    alpha2: "hu",
    alpha3: "hun",
    name: "Hungary",
    germaneName: "Ungarn",
  ),
  DefinedCountry(
    id: 352,
    alpha2: "is",
    alpha3: "isl",
    name: "Iceland",
    germaneName: "Island",
  ),
  DefinedCountry(
    id: 372,
    alpha2: "ie",
    alpha3: "irl",
    name: "Ireland",
    germaneName: "Irland",
  ),
  DefinedCountry(
    id: 380,
    alpha2: "it",
    alpha3: "ita",
    name: "Italy",
    germaneName: "Italien",
  ),
  DefinedCountry(
    id: 428,
    alpha2: "lv",
    alpha3: "lva",
    name: "Latvia",
    germaneName: "Lettland",
  ),
  DefinedCountry(
    id: 440,
    alpha2: "lt",
    alpha3: "ltu",
    name: "Lithuania",
    germaneName: "Litauen",
  ),
  DefinedCountry(
    id: 442,
    alpha2: "lu",
    alpha3: "lux",
    name: "Luxembourg",
    germaneName: "Luxemburg",
  ),
  DefinedCountry(
    id: 470,
    alpha2: "mt",
    alpha3: "mlt",
    name: "Malta",
    germaneName: "Malta",
  ),
  DefinedCountry(
    id: 498,
    alpha2: "md",
    alpha3: "mda",
    name: "Moldova",
    germaneName: "Moldawien",
  ),
  DefinedCountry(
    id: 499,
    alpha2: "me",
    alpha3: "mne",
    name: "Montenegro",
    germaneName: "Montenegro",
  ),
  DefinedCountry(
    id: 528,
    alpha2: "nl",
    alpha3: "nld",
    name: "Netherlands",
    germaneName: "Niederlande",
  ),
  DefinedCountry(
    id: 578,
    alpha2: "no",
    alpha3: "nor",
    name: "Norway",
    germaneName: "Norwegen",
  ),
  DefinedCountry(
    id: 616,
    alpha2: "pl",
    alpha3: "pol",
    name: "Poland",
    germaneName: "Polen",
  ),
  DefinedCountry(
    id: 620,
    alpha2: "pt",
    alpha3: "prt",
    name: "Portugal",
    germaneName: "Portugal",
  ),
  DefinedCountry(
    id: 642,
    alpha2: "ro",
    alpha3: "rou",
    name: "Romania",
    germaneName: "Rumänien",
  ),
  DefinedCountry(
    id: 643,
    alpha2: "ru",
    alpha3: "rus",
    name: "Russia",
    germaneName: "Russland",
  ),
  DefinedCountry(
    id: 688,
    alpha2: "rs",
    alpha3: "srb",
    name: "Serbia",
    germaneName: "Serbien",
  ),
  DefinedCountry(
    id: 703,
    alpha2: "sk",
    alpha3: "svk",
    name: "Slovakia",
    germaneName: "Slowakei",
  ),
  DefinedCountry(
    id: 705,
    alpha2: "si",
    alpha3: "svn",
    name: "Slovenia",
    germaneName: "Slowenien",
  ),
  DefinedCountry(
    id: 724,
    alpha2: "es",
    alpha3: "esp",
    name: "Spain",
    germaneName: "Spanien",
  ),
  DefinedCountry(
    id: 752,
    alpha2: "se",
    alpha3: "swe",
    name: "Sweden",
    germaneName: "Schweden",
  ),
  DefinedCountry(
    id: 756,
    alpha2: "ch",
    alpha3: "che",
    name: "Switzerland",
    germaneName: "Schweiz",
  ),
  DefinedCountry(
    id: 804,
    alpha2: "ua",
    alpha3: "ukr",
    name: "Ukraine",
    germaneName: "Ukraine",
  ),
  DefinedCountry(
    id: 826,
    alpha2: "gb",
    alpha3: "gbr",
    name: "United Kingdom of Great Britain and Northern Ireland",
    germaneName: "Vereinigtes Königreich",
  ),
  // DefinedCountry(
  //     id: 383,
  //     alpha2: "xk",
  //     alpha3: "xkx",
  //     name: "Kosovo",
  //     germaneName: "Kosovo"),
  // DefinedCountry(
  //     id: 438,
  //     alpha2: "li",
  //     alpha3: "lie",
  //     name: "Liechtenstein",
  //     germaneName: "Liechtenstein"),
  // DefinedCountry(
  //     id: 492,
  //     alpha2: "mc",
  //     alpha3: "mco",
  //     name: "Monaco",
  //     germaneName: "Monaco"),
  // DefinedCountry(
  //     id: 807,
  //     alpha2: "mk",
  //     alpha3: "mkd",
  //     name: "North Macedonia",
  //     germaneName: "Nordmazedonien"),
  // DefinedCountry(
  //     id: 674,
  //     alpha2: "sm",
  //     alpha3: "smr",
  //     name: "San Marino",
  //     germaneName: "San Marino"),
  // DefinedCountry(
  //     id: 792,
  //     alpha2: "tr",
  //     alpha3: "tur",
  //     name: "Turkey",
  //     germaneName: "Türkei"),
];

DefinedCountry? getDefinedCountryByName(String name) {
  for (DefinedCountry country in europeEnglishCountries) {
    if (country.name.toLowerCase() == name.toLowerCase()) {
      return country;
    }
  }
  return null; // Return null if no matching country is found.
}

DefinedCountry? getDefinedCountryByIso3(String alpha3) {
  for (DefinedCountry country in europeEnglishCountries) {
    if (country.alpha3.toLowerCase() == alpha3.toLowerCase()) {
      return country;
    }
  }
  return null; // Return null if no matching country is found.
}

DefinedCountry? getDefinedCountryByIso2(String alpha2) {
  for (DefinedCountry country in europeEnglishCountries) {
    if (country.alpha2.toLowerCase() == alpha2.toLowerCase()) {
      return country;
    }
  }
  return null; // Return null if no matching country is found.
}
