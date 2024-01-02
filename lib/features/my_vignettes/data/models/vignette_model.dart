import 'package:tollhopper/features/my_vignettes/presentation/widget/vignette_list_enum.dart';

class VignetteModel {
  final String? licencePilateCountry;
  final String? type;
  final String? productCountryCode;

  final String? productId;
  final String? priceId;
  final String? vehicleId;
  final String? title;
  final String? startDate;
  final String? endDate;
  final String? licencePilate;
  final String? licencePilateRegex;
  final VignettesListEnum? status;
  final String? fileName;

  VignetteModel({
    this.licencePilateRegex,
    this.licencePilateCountry,
    this.type,
    this.productCountryCode,
    this.productId,
    this.priceId,
    this.vehicleId,
    this.title,
    this.startDate,
    this.endDate,
    this.status,
    this.licencePilate,
    this.fileName,
  });

  factory VignetteModel.fromJson(Map<String, dynamic> json) => VignetteModel(
        licencePilateCountry: json["licence_pilate_country"],
        type: json["type"],
        productCountryCode: json["product_countryCode"],
        productId: json["product_id"],
        priceId: json["price_id"],
        vehicleId: json["vehicle_id"],
        title: json["title"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        status: json["status"] == "Active"
            ? VignettesListEnum.active
            : VignettesListEnum.expired,
        licencePilate: json["licence_pilate"],
        licencePilateRegex: json["licence_pilate_regex"],
        fileName: json['file_name'],
      );
}
