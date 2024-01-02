import 'package:tollhopper/features/home_tab/data/models/gru_api_modeles/gru_tolls_model.dart';
import 'package:tollhopper/features/home_tab/data/models/gru_api_modeles/gru_vignette_model.dart';
import 'package:tollhopper/features/home_tab/data/models/gru_api_modeles/summary_model.dart';
import 'package:tollhopper/global/utils/const.dart';
import 'package:tollhopper/global/utils/countries_names_utils.dart';

class TollRoutesModel {
  SummaryGruModel? summary;
  List<TollsGruModel>? tolls;
  String? polyline;
  List<VignettesGruModel>? vignettes;

  TollRoutesModel({
    this.summary,
    this.tolls,
    this.polyline,
    this.vignettes,
  });

  TollRoutesModel.fromJson(Map<String, dynamic> json) {
    summary = json['summary'] != null
        ? SummaryGruModel.fromJson(json['summary'])
        : null;
    if (json['tolls'] != null) {
      tolls = <TollsGruModel>[];
      json['tolls'].forEach((v) {
        tolls!.add(TollsGruModel.fromJson(v));
      });
    }
    polyline = json['polyline'] ?? "";
    if (json['vignettes'] != null) {
      vignettes = <VignettesGruModel>[];
      json['vignettes'].forEach((v) {
        vignettes!.add(VignettesGruModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (tolls != null) {
      data['tolls'] = tolls!.map((v) => v.toJson()).toList();
    }
    data['polyline'] = polyline;
    if (vignettes != null) {
      data['vignettes'] = vignettes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  bool hasCzechVignette() {
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() == czechCodeName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasRomaniaVignette() {
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() == romaniaCodeName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasHungaryVignette() {
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() == hungaryCodeName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasSwitzerlandVignette() {
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() == switzerlandCodeName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasSloveniaVignette() {
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() == sloveniaCodeName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasAustriaVignette() {
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() == austriaCodeName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasSloveniaTolls() {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == sloveniaName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasAustriaTolls() {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == austriaName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasSwitzerlandTolls() {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == switzerlandName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasHungaryTolls() {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == hungaryName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasRomaniaTolls() {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == romaniaName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool hasCzechTolls() {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == czechName) {
            return true;
          }
        }
      }
    }
    return false;
  }

  List<String> getRoadsAustriaTolls() {
    List<String> outPut = [];
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() == austriaName &&
              element.road != null) {
            outPut.add(element.road!);
          }
        }
      }
    }
    return outPut;
  }

  List<DefinedCountry> getOtherCountriesTolls(
      List<DefinedCountry> listFromVignette) {
    if (tolls != null) {
      if (tolls!.isNotEmpty) {
        for (var element in tolls!) {
          if (element.country?.toLowerCase() != austriaName &&
              element.country?.toLowerCase() != sloveniaName &&
              element.country?.toLowerCase() != switzerlandName &&
              element.country?.toLowerCase() != hungaryName &&
              element.country?.toLowerCase() != romaniaName &&
              element.country?.toLowerCase() != czechName) {
            if (element.country != null) {
              var definedCountry = getDefinedCountryByName(element.country!);
              if (definedCountry != null) {
                definedCountry.hasTolls = true;
                if (listFromVignette
                    .any((country) => country.name == element.country)) {
                  listFromVignette
                      .firstWhere((country) => country.name == element.country)
                      .hasTolls = true;
                } else {
                  listFromVignette.add(definedCountry);
                }
              }
            }
          }
        }
      }
    }
    return listFromVignette;
  }

  List<DefinedCountry> getOtherCountriesVignettes() {
    List<DefinedCountry> output = [];
    if (vignettes != null) {
      if (vignettes!.isNotEmpty) {
        for (var element in vignettes!) {
          if (element.countryCode?.toLowerCase() != austriaCodeName &&
              element.countryCode?.toLowerCase() != sloveniaCodeName &&
              element.countryCode?.toLowerCase() != switzerlandCodeName &&
              element.countryCode?.toLowerCase() != hungaryCodeName &&
              element.countryCode?.toLowerCase() != romaniaCodeName &&
              element.countryCode?.toLowerCase() != czechCodeName) {
            if (element.countryCode != null) {
              var definedCountry =
                  getDefinedCountryByIso3(element.countryCode!);
              if (definedCountry != null) {
                definedCountry.hasVignettes = true;
                output.add(definedCountry);
              }
            }
          }
        }
      }
    }
    return output;
  }
}

// class Costs {
//   double? fuel;
//   double? tag;
//   double? cash;
//   double? prepaidCard;
//
//   Costs({this.fuel, this.tag, this.cash, this.prepaidCard});
//
//   Costs.fromJson(Map<String, dynamic> json) {
//     fuel = json['fuel'];
//     tag = json['tag'];
//     cash = json['cash'];
//     prepaidCard = json['prepaidCard'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fuel'] = fuel;
//     data['tag'] = tag;
//     data['cash'] = cash;
//     data['prepaidCard'] = prepaidCard;
//     return data;
//   }
// }
