import 'package:tollhopper/global/utils/functions.dart';

class SummaryGruModel {
  bool? hasTolls;
  bool? hasExpressTolls;
  String? url;
  Distance? distance;
  Duration? duration;
  String? name;
  List<String>? countries;

  SummaryGruModel({
    this.hasTolls,
    this.hasExpressTolls,
    this.url,
    this.distance,
    this.duration,
    this.name,
    this.countries,
  });

  SummaryGruModel.fromJson(Map<String, dynamic> json) {
    hasTolls = json['hasTolls'];
    hasExpressTolls = json['hasExpressTolls'];
    url = json['url'];
    distance =
        json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    duration =
        json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    name = json['name'];

    countries =
        (json['countries'] != null) ? json['countries'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasTolls'] = hasTolls;
    data['hasExpressTolls'] = hasExpressTolls;
    data['url'] = url;
    if (distance != null) {
      data['distance'] = distance!.toJson();
    }
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    data['name'] = name;
    data['countries'] = countries;
    return data;
  }
}

class Diffs {
  int? cheapest;
  int? fastest;

  Diffs({this.cheapest, this.fastest});

  Diffs.fromJson(Map<String, dynamic> json) {
    cheapest = json['cheapest'];
    fastest = json['fastest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cheapest'] = cheapest;
    data['fastest'] = fastest;
    return data;
  }
}

class Distance {
  String? text;
  String? metric;
  double? value;

  Distance({this.text, this.metric, this.value});

  Distance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    metric = json['metric'];
    value = checkDouble(json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = text;
    data['metric'] = metric;
    data['value'] = value;
    return data;
  }
}

class Duration {
  String? text;
  double? value;

  Duration({this.text, this.value});

  Duration.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = checkDouble(json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = text;
    data['value'] = value;
    return data;
  }
}
