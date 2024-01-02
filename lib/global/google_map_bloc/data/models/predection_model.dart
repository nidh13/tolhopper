class PredictionModel {
  String? description;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;

  PredictionModel({
    this.description,
    this.placeId,
    this.reference,
    this.structuredFormatting,
  });

  PredictionModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
    reference = json['reference'];
    structuredFormatting = json['structured_formatting'] != null
        ? StructuredFormatting.fromJson(json['structured_formatting'])
        : null;
  }
}

class StructuredFormatting {
  String? mainText;
  String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    secondaryText = json['secondary_text'];
  }
}
