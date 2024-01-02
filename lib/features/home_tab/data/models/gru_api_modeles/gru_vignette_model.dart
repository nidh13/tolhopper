import 'package:tollhopper/global/utils/functions.dart';

class VignettesGruModel {
  String? type;
  String? country;
  String? countryCode;
  List<Rates>? rates;
  Start? start;
  End? end;

  VignettesGruModel({
    this.type,
    this.country,
    this.countryCode,
    this.rates,
    this.start,
    this.end,
  });

  VignettesGruModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    country = json['country'];
    countryCode = json['countryCode'];
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(Rates.fromJson(v));
      });
    }
    start = json['start'] != null ? Start.fromJson(json['start']) : null;
    end = json['end'] != null ? End.fromJson(json['end']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['country'] = country;
    data['countryCode'] = countryCode;
    if (rates != null) {
      data['rates'] = rates!.map((v) => v.toJson()).toList();
    }
    if (start != null) {
      data['start'] = start!.toJson();
    }
    if (end != null) {
      data['end'] = end!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'VignettesGruModel{type: $type, country: $country, countryCode: $countryCode, rates: $rates, start: $start, end: $end}';
  }
}

class Start {
  double? lat;
  double? lng;

  Start({
    this.lat,
    this.lng,
  });

  Start.fromJson(Map<String, dynamic> json) {
    lat = checkDouble(json['lat']);
    lng = checkDouble(json['lng']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }

  @override
  String toString() {
    return 'Start{lat: $lat, lng: $lng}';
  }
}

class End {
  double? longitude;
  double? latitude;

  End({this.longitude, this.latitude});

  End.fromJson(Map<String, dynamic> json) {
    longitude = checkDouble(json['longitude']);
    latitude = checkDouble(json['latitude']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }

  @override
  String toString() {
    return 'End{longitude: $longitude, latitude: $latitude}';
  }
}

class Rates {
  String? duration;
  double? vignetteCost;
  String? currencyUnit;

  Rates({this.duration, this.vignetteCost, this.currencyUnit});

  Rates.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    vignetteCost = checkDouble(json['vignetteCost']);
    currencyUnit = json['currencyUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = duration;
    data['vignetteCost'] = vignetteCost;
    data['currencyUnit'] = currencyUnit;
    return data;
  }

  @override
  String toString() {
    return 'Rates{duration: $duration, vignetteCost: $vignetteCost, currencyUnit: $currencyUnit}';
  }
}
