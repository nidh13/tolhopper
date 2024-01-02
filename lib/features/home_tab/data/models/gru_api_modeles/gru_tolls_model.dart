import 'package:tollhopper/global/utils/functions.dart';

class TollsGruModel {
  int? id;
  double? lat;
  double? lng;
  String? name;
  String? road;
  String? state;
  String? country;
  String? type;
  double? tagCost;
  double? tagPriCost;
  double? tagSecCost;
  double? cashCost;
  double? prepaidCardCost;
  String? currency;
  List<String>? tagPrimaryNames;
  List<String>? tagPrimary;
  List<String>? tagSecondary;
  String? tagRequested;
  Arrival? arrival;

  TollsGruModel(
      {this.id,
      this.lat,
      this.lng,
      this.name,
      this.road,
      this.state,
      this.country,
      this.type,
      this.tagCost,
      this.tagPriCost,
      this.tagSecCost,
      this.cashCost,
      this.prepaidCardCost,
      this.currency,
      this.tagPrimaryNames,
      this.tagPrimary,
      this.tagSecondary,
      this.tagRequested,
      this.arrival});

  TollsGruModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = checkDouble(json['lat']);
    lng = checkDouble(json['lng']);
    name = json['name'];
    road = json['road'];
    state = json['state'];
    country = json['country'];
    type = json['type'];
    tagCost = checkDouble(json['tagCost']);
    tagPriCost = checkDouble(json['tagPriCost']);
    tagSecCost = checkDouble(json['tagSecCost']);
    cashCost = checkDouble(json['cashCost']);
    prepaidCardCost = checkDouble(json['prepaidCardCost']);
    currency = json['currency'];
    tagPrimaryNames = json['tagPrimaryNames']?.cast<String>();
    tagPrimary = json['tagPrimary']?.cast<String>();
    tagSecondary = json['tagSecondary']?.cast<String>();
    tagRequested = json['tagRequested'];
    arrival =
        json['arrival'] != null ? Arrival.fromJson(json['arrival']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['lat'] = lat;
    data['lng'] = lng;
    data['name'] = name;
    data['road'] = road;
    data['state'] = state;
    data['country'] = country;
    data['type'] = type;
    data['tagCost'] = tagCost;
    data['tagPriCost'] = tagPriCost;
    data['tagSecCost'] = tagSecCost;
    data['cashCost'] = cashCost;
    data['prepaidCardCost'] = prepaidCardCost;
    data['currency'] = currency;
    data['tagPrimaryNames'] = tagPrimaryNames;
    data['tagPrimary'] = tagPrimary;
    data['tagSecondary'] = tagSecondary;
    data['tagRequested'] = tagRequested;
    if (arrival != null) {
      data['arrival'] = arrival!.toJson();
    }
    return data;
  }
}

class Arrival {
  double? distance;
  String? time;

  Arrival({
    this.distance,
    this.time,
  });

  Arrival.fromJson(Map<String, dynamic> json) {
    distance = json['distance'].toDouble();

    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = distance;
    data['time'] = time;
    return data;
  }
}

// class Point {
//   String? type;
//   Geometry? geometry;
//
//   Point({this.type, this.geometry});
//
//   Point.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     geometry = json['geometry'] != null
//         ? new Geometry.fromJson(json['geometry'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     if (this.geometry != null) {
//       data['geometry'] = this.geometry!.toJson();
//     }
//     return data;
//   }
// }

// class Geometry {
//   String? type;
//   List<double>? coordinates;
//
//   Geometry({this.type, this.coordinates});
//
//   Geometry.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<double>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     return data;
//   }
// }
