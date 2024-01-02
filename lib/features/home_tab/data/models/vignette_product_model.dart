import 'package:equatable/equatable.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/global/utils/enums/product_type_enum.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:uuid/uuid.dart';

class VignetteProduct extends Equatable {
  String? id;
  List<VignetteProductPrices>? prices;
  int? iV;
  String? description;
  String? title;
  String? countryCode;
  String? type;
  String? handle;
  String? duration;
  String? image;
  List<Generals>? generals;
  double? tva;
  bool selected;
  int indexPriceSelected;

  VignetteProduct({
    this.id,
    this.prices,
    this.iV,
    this.description,
    this.title,
    this.countryCode,
    this.type,
    this.handle,
    this.duration,
    this.image,
    this.generals,
    this.tva,
    this.indexPriceSelected = 0,
    this.selected = false,
  });

  factory VignetteProduct.fromJson(Map<String, dynamic> json) {
    var _generals = <Generals>[];
    var _prices = <VignetteProductPrices>[];
    if (json['prices'] != null) {
      json['prices'].forEach((v) {
        _prices.add(VignetteProductPrices.fromJson(v));
      });
    }
    for (var price in _prices) {
      if (price.hasTwoTRip) {
        final twoTripPrice = _prices
            .where((element) =>
                element.name == price.name && element.option == "2 Trips")
            .toList();
        if (twoTripPrice.isNotEmpty) {
          price.idTwoTripe = twoTripPrice.first.id;
          price.twoTripPriceWithTva = twoTripPrice.first.priceWithTva;
          price.twoTripServicePrice = twoTripPrice.first.servicePrice;
        }
      }
      if (price.hasAnnualCard) {
        final annualCardPrice = _prices
            .where((element) =>
                element.name == price.name && element.option == "Annual Card")
            .toList();
        if (annualCardPrice.isNotEmpty) {
          price.idAnnualCard = annualCardPrice.first.id;
          price.annualCardPriceWithTva = annualCardPrice.first.priceWithTva;
          price.annualCardServicePrice = annualCardPrice.first.servicePrice;
        }
      }
    }
    if (json['generals'] != null) {
      _generals = <Generals>[];
      json['generals'].forEach((v) {
        _generals.add(Generals.fromJson(v));
      });
    }
    return VignetteProduct(
      tva: checkDouble(json['tva']),
      id: json['_id'],
      handle: json['handle'],
      description: json['description'],
      title: json['title'],
      countryCode: json['countryCode'],
      duration: json['duration'],
      generals: _generals,
      image: json['image'],
      iV: json['__v'],
      prices: _prices,
      type: json['type'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        prices,
        iV,
        description,
        title,
        countryCode,
        type,
        handle,
        duration,
        image,
        generals,
        tva
      ];
  void getPricesByRoads(List<String> roads) {
    List<VignetteProductPrices> output = [];
    if (prices != null) {
      for (var price in prices!) {
        if (price.priceIsInRoads(roads: roads)) {
          output.add(price);
        }
      }
    }
    prices = output;
  }

  List<CartModel> getCartModel({
    required String vehicleId,
    required String dateStart,
    required String dateEnd,
    required String vehicleType,
    required List<String>? countries,
    required String? googleUrl,
    required String? tollGruDuration,
  }) {
    List<CartModel> listToReturn = [];
    final generalEnglish = generals
        ?.firstWhere((element) => element.language?.toLowerCase() == "en");
    final generalGerman = generals
        ?.firstWhere((element) => element.language?.toLowerCase() == "de");
    if (type == ProductTypeEnum.vignette.name) {
      final price = getPriceWithVehicleType(type: vehicleType);
      if (selected) {
        listToReturn.add(CartModel(
          id: const Uuid().v1(),
          title: generalEnglish?.title ?? "",
          vehicleId: vehicleId,
          dateStart: dateStart,
          dateEnd: dateEnd,
          description: generalEnglish?.description ?? "",
          servicePrice: price?.servicePrice ?? 0.0,
          priceWithTva: price?.priceWithTva ?? 0.0,
          option: null,
          priceId: price?.id ?? "",
          productType: ProductTypeEnum.vignette.name,
          productId: id ?? "",
          vehicleType: vehicleType,
          duration: duration,
          germanDescription: generalGerman?.description ?? "",
          germanTitle: generalGerman?.title ?? "",
          countries: countries,
          googleUrl: googleUrl,
          tollGruDuration: tollGruDuration,
        ));
      }
    } else if (type == ProductTypeEnum.toll.name) {
      if (prices != null) {
        for (var price in prices!) {
          if (price.selected) {
            if (price.hasTwoTripSelected) {
              listToReturn.add(CartModel(
                id: const Uuid().v1(),
                title: price.name ?? "",
                vehicleId: vehicleId,
                dateStart: dateStart,
                productType: ProductTypeEnum.toll.name,
                dateEnd: dateEnd,
                description: generalEnglish?.description ?? "",
                servicePrice: price.twoTripServicePrice ?? 0.0,
                priceWithTva: price.twoTripPriceWithTva ?? 0.0,
                option: "2 Trips",
                priceId: price.idTwoTripe ?? "",
                productId: id ?? "",
                vehicleType: vehicleType,
                duration: duration,
                germanDescription: generalGerman?.description ?? "",
                germanTitle: null,
                hasTwoTrip: true,
                isAnnualCard: false,
                countries: countries,
                googleUrl: googleUrl,
                tollGruDuration: tollGruDuration,
              ));
            } else {
              listToReturn.add(CartModel(
                id: const Uuid().v1(),
                title: price.name ?? "",
                productType: ProductTypeEnum.toll.name,
                vehicleId: vehicleId,
                dateStart: dateStart,
                dateEnd: dateEnd,
                description: generalEnglish?.description ?? "",
                servicePrice: price.servicePrice ?? 0.0,
                priceWithTva: price.priceWithTva ?? 0.0,
                option: "1 Trip",
                priceId: price.id ?? "",
                productId: id ?? "",
                vehicleType: vehicleType,
                duration: duration,
                germanDescription: generalGerman?.description ?? "",
                germanTitle: null,
                countries: countries,
                googleUrl: googleUrl,
                tollGruDuration: tollGruDuration,
              ));
            }
          }
        }
      }
    }
    return listToReturn;
  }

  List<CartModel> getCartModelFromToll() {
    List<CartModel> listToReturn = [];
    final generalEnglish = generals
        ?.firstWhere((element) => element.language?.toLowerCase() == "en");
    final generalGerman = generals
        ?.firstWhere((element) => element.language?.toLowerCase() == "de");
    if (prices != null) {
      for (var price in prices!) {
        if (price.selected) {
          if (price.hasTwoTripSelected) {
            listToReturn.add(CartModel(
                id: const Uuid().v1(),
                title: price.name ?? "",
                vehicleId: null,
                dateStart: formatDateToApi(DateTime.now()),
                productType: ProductTypeEnum.toll.name,
                dateEnd: null,
                description: generalEnglish?.description ?? "",
                servicePrice: price.twoTripServicePrice ?? 0.0,
                priceWithTva: price.twoTripPriceWithTva ?? 0.0,
                option: "2 Trips",
                priceId: price.idTwoTripe ?? "",
                productId: id ?? "",
                vehicleType: null,
                duration: duration,
                germanDescription: generalGerman?.description ?? "",
                germanTitle: null,
                isAnnualCard: false,
                hasTwoTrip: true));
          } else if (price.hasAnnualCardSelected) {
            listToReturn.add(CartModel(
                id: const Uuid().v1(),
                title: price.name ?? "",
                vehicleId: null,
                dateStart: formatDateToApi(DateTime.now()),
                productType: ProductTypeEnum.toll.name,
                dateEnd: null,
                description: generalEnglish?.description ?? "",
                servicePrice: price.annualCardServicePrice ?? 0.0,
                priceWithTva: price.annualCardPriceWithTva ?? 0.0,
                option: "Annual Card",
                priceId: price.idAnnualCard ?? "",
                productId: id ?? "",
                vehicleType: null,
                duration: duration,
                germanDescription: generalGerman?.description ?? "",
                germanTitle: null,
                hasTwoTrip: false,
                isAnnualCard: true));
          } else {
            listToReturn.add(CartModel(
                id: const Uuid().v1(),
                title: price.name ?? "",
                productType: ProductTypeEnum.toll.name,
                vehicleId: null,
                dateStart: formatDateToApi(DateTime.now()),
                dateEnd: null,
                description: generalEnglish?.description ?? "",
                servicePrice: price.servicePrice ?? 0.0,
                priceWithTva: price.priceWithTva ?? 0.0,
                option: "1 Trip",
                priceId: price.id ?? "",
                productId: id ?? "",
                vehicleType: null,
                duration: duration,
                germanDescription: generalGerman?.description ?? "",
                germanTitle: null,
                isAnnualCard: false,
                hasTwoTrip: false));
          }
        }
      }
    }
    return listToReturn;
  }

  VignetteProductPrices? getPriceWithVehicleType({required String type}) {
    if (prices != null) {
      for (var price in prices!) {
        if (price.vehicle?.type == type) {
          return price;
        }
      }
    }
    return null;
  }

  CartModel getCartModelFromVignetteByPriceSelected(
      {required String dateStart}) {
    final generalEnglish = generals
        ?.firstWhere((element) => element.language?.toLowerCase() == "en");
    final generalGerman = generals
        ?.firstWhere((element) => element.language?.toLowerCase() == "de");
    final price = prices?[indexPriceSelected];
    return CartModel(
      id: const Uuid().v1(),
      title: generalEnglish?.title ?? "",
      vehicleId: price?.vehicle?.id ?? "",
      dateStart: dateStart,
      dateEnd: null,
      description: generalEnglish?.description ?? "",
      servicePrice: price?.servicePrice ?? 0.0,
      priceWithTva: price?.priceWithTva ?? 0.0,
      option: null,
      priceId: price?.id ?? "",
      productType: ProductTypeEnum.vignette.name,
      productId: id ?? "",
      vehicleType: price?.vehicle?.type ?? "",
      duration: duration,
      germanDescription: generalGerman?.description ?? "",
      germanTitle: generalGerman?.title ?? "",
    );
  }
}

class VignetteProductPrices extends Equatable {
  String? id;

  PriceVehicle? vehicle;
  String? option;
  String? name;
  double? priceWithTva;
  double? servicePrice;
  double? price;
  double? tva;
  String? currency;
  bool selected;
  // two Trip
  bool hasTwoTRip;
  bool hasTwoTripSelected;
  double? twoTripServicePrice;
  double? twoTripPriceWithTva;
  String? idTwoTripe;
  //annualCard
  bool hasAnnualCard;
  bool hasAnnualCardSelected;
  double? annualCardServicePrice;
  double? annualCardPriceWithTva;
  String? idAnnualCard;

  VignetteProductPrices({
    this.id,
    this.vehicle,
    this.priceWithTva,
    this.servicePrice,
    this.price,
    this.name,
    this.currency,
    this.option,
    this.tva,
    this.hasTwoTRip = false,
    this.hasTwoTripSelected = false,
    this.selected = false,
    this.hasAnnualCardSelected = false,
    this.hasAnnualCard = false,
  });

  factory VignetteProductPrices.fromJson(Map<String, dynamic> json) {
    return VignetteProductPrices(
        id: json['_id'],
        price: checkDouble(json['price']),
        name: json['name'],
        option: json['option'],
        currency: json['currency'],
        priceWithTva: checkDouble(json['price_with_tva']),
        servicePrice: checkDouble(json['service_price']),
        tva: checkDouble(json['tva']),
        hasTwoTRip: json['hasTwoTRip'] ?? false,
        hasAnnualCard: json['hasAnnualCard'] ?? false,
        vehicle: json['vehicle'] != null
            ? PriceVehicle.fromJson(json['vehicle'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) {
      data['_id'] = id;
    }
    if (vehicle != null) {
      data['vehicle'] = vehicle;
    }
    if (priceWithTva != null) {
      data['price_with_tva'] = priceWithTva;
    }
    if (servicePrice != null) {
      data['service_price'] = servicePrice;
    }
    if (price != null) {
      data['price'] = price;
    }
    if (tva != null) {
      data['tva'] = tva;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (option != null) {
      data['option'] = option;
    }
    if (currency != null) {
      data['currency'] = currency;
    }
    data['hasTwoTRip'] = hasTwoTRip;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        vehicle,
        priceWithTva,
        servicePrice,
        price,
        name,
        option,
        tva,
        currency
      ];

  String displayPrice() {
    //price_with_tva + service_price
    if (priceWithTva != null && servicePrice != null) {
      return (priceWithTva! + servicePrice!).toStringAsFixed(2);
    }
    return "";
  }

  String displayTwoTripPrice() {
    //price_with_tva + service_price
    if (twoTripPriceWithTva != null && twoTripServicePrice != null) {
      return (twoTripPriceWithTva! + twoTripServicePrice!).toStringAsFixed(2);
    }
    return "";
  }

  String displayAnnualCardPrice() {
    //price_with_tva + service_price
    if (annualCardPriceWithTva != null && annualCardServicePrice != null) {
      return (annualCardPriceWithTva! + annualCardServicePrice!)
          .toStringAsFixed(2);
    }
    return "";
  }

  bool priceIsInRoads({required List<String> roads}) {
    for (var road in roads) {
      if (name != null) {
        if (name!.contains(road)) {
          return true;
        }
      }
    }
    return false;
  }
}

class Generals extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? shortDescription;
  final String? handle;
  final String? language;
  final String? metaDescription;
  final String? metaTitle;
  final String? metaKey;

  const Generals({
    this.id,
    this.title,
    this.description,
    this.handle,
    this.language,
    this.shortDescription,
    this.metaDescription,
    this.metaTitle,
    this.metaKey,
  });

  factory Generals.fromJson(Map<String, dynamic> json) {
    return Generals(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      handle: json['handle'],
      language: json['language'],
      metaDescription: json['meta_description'],
      metaKey: json['meta_title'],
      metaTitle: json['meta_key'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) {
      data['_id'] = id;
    }
    if (title != null) {
      data['title'] = title;
    }
    if (description != null) {
      data['description'] = description;
    }
    if (handle != null) {
      data['handle'] = handle;
    }
    if (language != null) {
      data['language'] = language;
    }
    if (metaDescription != null) {
      data['meta_description'] = metaDescription;
    }
    if (metaTitle != null) {
      data['meta_title'] = metaTitle;
    }
    if (metaKey != null) {
      data['meta_key'] = metaKey;
    }
    if (metaKey != null) {
      data['shortDescription'] = metaKey;
    }
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        shortDescription,
        handle,
        language,
        metaDescription,
        metaTitle,
        metaKey,
      ];
}

class PriceVehicle {
  String? id;
  String? title;
  String? description;
  int? iV;
  String? logo;
  String? logoUrl;
  String? type;

  PriceVehicle({
    this.id,
    this.title,
    this.description,
    this.iV,
    this.logo,
    this.logoUrl,
    this.type,
  });

  PriceVehicle.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    iV = json['__v'];
    logo = json['logo'];
    logoUrl = json['logo_url'];
    type = json['type'];
  }
}

List<CartModel> getAllCartModelFromProductList({
  required String vehicleId,
  required String dateStart,
  required String dateEnd,
  required String vehicleType,
  required List<VignetteProduct> listProduct,
  required List<String>? countries,
  required String? googleUrl,
  required String? tollGruDuration,
}) {
  List<CartModel> outPut = [];
  for (var product in listProduct) {
    final list = product.getCartModel(
      vehicleType: vehicleType,
      dateEnd: dateEnd,
      dateStart: dateStart,
      vehicleId: vehicleId,
      countries: countries,
      googleUrl: googleUrl,
      tollGruDuration: tollGruDuration,
    );
    if (list.isNotEmpty) {
      outPut.addAll(list);
    }
  }
  return outPut;
}
