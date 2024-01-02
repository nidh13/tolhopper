import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/string_extensions.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

class CartModel {
  final String id;
  final String productId;
  final String priceId;
  final String? vehicleType;
  final String productType;
  final String? vehicleId;
  final String? dateStart;
  final String? dateEnd;
  final String? option;
  final double priceWithTva;
  final double servicePrice;
  final String? duration;
  final String description;
  final bool isAnnualCard;
  final String? googleUrl;
  final List<String>? countries;
  final String? tollGruDuration;
  final bool hasTwoTrip;
  final String title;
  final String? germanDescription;
  final String? germanTitle;

  CartModel({
    required this.id,
    required this.productId,
    required this.priceId,
    required this.vehicleType,
    required this.productType,
    this.vehicleId,
    required this.dateStart,
    required this.dateEnd,
    required this.option,
    required this.priceWithTva,
    required this.servicePrice,
    this.duration,
    this.germanDescription,
    required this.title,
    this.isAnnualCard = false,
    this.hasTwoTrip = false,
    required this.description,
    this.germanTitle,
    this.countries,
    this.googleUrl,
    this.tollGruDuration,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'priceId': priceId,
      'vehicleType': vehicleType,
      'productType': productType,
      'vehicleId': vehicleId,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'option': option,
      'priceWithTva': priceWithTva,
      'servicePrice': servicePrice,
      'duration': duration,
      'description': description,
      'title': title,
      'germanDescription': germanDescription,
      'germanTitle': germanTitle,
      'hasTwoTrip': hasTwoTrip,
      'isAnnualCard': isAnnualCard,
      'countries': (countries != null) ? jsonEncode(countries) : null,
      'googleUrl': googleUrl,
      'tollGruDuration': tollGruDuration,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        productId: json['productId'],
        priceId: json['priceId'],
        vehicleType: json['vehicleType'],
        productType: json['productType'],
        vehicleId: json['vehicleId'],
        dateStart: json['dateStart'],
        dateEnd: json['dateEnd'],
        option: json['option'],
        priceWithTva: json['priceWithTva'],
        servicePrice: json['servicePrice'],
        duration: json['duration'],
        description: json['description'],
        title: json['title'],
        germanDescription: json['germanDescription'],
        germanTitle: json['germanTitle'],
        hasTwoTrip: json['hasTwoTrip'],
        countries: (json['countries'] != null)
            ? List<String>.from(jsonDecode(json['countries']))
            : null,
        googleUrl: json['googleUrl'],
        tollGruDuration: json['tollGruDuration'],
        isAnnualCard: json['isAnnualCard']);
  }

  @override
  String toString() {
    return 'CartModel{id: $id, productId: $productId, priceId: $priceId, vehicleType: $vehicleType, productType: $productType, vehicleId: $vehicleId, dateStart: $dateStart, dateEnd: $dateEnd, option: $option, priceWithTva: $priceWithTva, servicePrice: $servicePrice, duration: $duration, description: $description, isAnnualCard: $isAnnualCard, hasTwoTrip: $hasTwoTrip, title: $title, germanDescription: $germanDescription, germanTitle: $germanTitle}';
  }

  String getDescriptionWithLanguageCode(BuildContext context) {
    final languageCode = getLocaleLanguageCode(context);
    if (languageCode == "de") {
      return germanDescription ?? description;
    }
    return description;
  }

  String getTitleWithLanguageCode(BuildContext context) {
    final languageCode = getLocaleLanguageCode(context);
    if (languageCode == "de") {
      return germanTitle ?? title;
    }
    return title;
  }

  String getPackageNameWithLanguageCode(BuildContext context) {
    final languageCode = getLocaleLanguageCode(context);
    if (languageCode == "de" && productType == 'vignette') {
      return LocaleKeys.vignettes_app_bar_title.tr().toCapitalized();
    }
    return productType.toCapitalized();
  }

  String displayPrice() {
    //price_with_tva + service_price
    return formatPriceNoCurrency((priceWithTva + servicePrice).toStringAsFixed(2));
  }

  bool annualCardChecked() {
    return productType == "";
  }
}

String calculateTotalCartPrice({required List<CartModel> listItems}) {
  double total = 0.0;
  for (var item in listItems) {
    total += item.priceWithTva + item.servicePrice;
  }
  return total.toStringAsFixed(2);
}
