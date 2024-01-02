import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/features/home_tab/data/models/country_map_model.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/app_keys.dart';

abstract class ProductDataSource {
  Future<List<VignetteProduct>> getAllVignetteProduct();

  Future<List<PriceVehicle>> getAllVehicles();

  Future<List<TollRoutesModel>> getAllRoutesWithStringLocations({
    required Map<String, dynamic> getRouteMap,
  });

  Future<List<TollRoutesModel>> getAllRoutesWithGeoCoordinatesLocations({
    required double latStartLocation,
    required String lngStartLocation,
    required double latDestination,
    required String lngDestination,
  });

  Future<List<VignetteProduct>> getAllVignetteProductFilter({
    required String dateStart,
    required String dateEnd,
    required String vehicleId,
    required String productType,
    required String countryCode,
  });

  Future<List<CountryMapModel>> getCountriesMap();
}

class ProductDataSourceImpl extends ProductDataSource {
  final http.Client client;

  ProductDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<VignetteProduct>> getAllVignetteProduct() async {
    final response = await client.get(
      Uri.parse(getAllVignetteProductApi),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["products"];
      List<VignetteProduct> vignetteProductList = List<VignetteProduct>.from(
        l.map(
          (model) => VignetteProduct.fromJson(model),
        ),
      );
      return vignetteProductList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TollRoutesModel>> getAllRoutesWithStringLocations({
    required Map<String, dynamic> getRouteMap,
  }) async {
    print(getRouteMap);
    final response = await client
        .post(
          Uri.parse(tollGruApi),
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': tollGruApiKey
          },
          body: jsonEncode(getRouteMap),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["routes"];
      List<TollRoutesModel> tollRoutesModelList = List<TollRoutesModel>.from(
          l.map((model) => TollRoutesModel.fromJson(model)));
      return tollRoutesModelList;
    } else if (response.statusCode == 502 || response.statusCode == 400) {
      throw UndefinedCountryException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TollRoutesModel>> getAllRoutesWithGeoCoordinatesLocations({
    required double latStartLocation,
    required String lngStartLocation,
    required double latDestination,
    required String lngDestination,
  }) async {
    final Map<String, dynamic> requestBody = {
      "from": {"lat": latStartLocation, "lng": lngStartLocation},
      "to": {"lat": latDestination, "lng": lngDestination}
    };

    final response = await client
        .post(
          Uri.parse(tollGruApi),
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': tollGruApiKey
          },
          body: jsonEncode(requestBody),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["routes"];
      List<TollRoutesModel> tollRoutesModelList = List<TollRoutesModel>.from(
          l.map((model) => TollRoutesModel.fromJson(model)));
      return tollRoutesModelList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<VignetteProduct>> getAllVignetteProductFilter({
    required String dateStart,
    required String dateEnd,
    required String vehicleId,
    required String productType,
    required String countryCode,
  }) async {
    final Map<String, dynamic> requestBody = {
      "type": productType,
      "countryCode": countryCode,
      "vehicle_id": vehicleId,
      "endDate": dateEnd,
      "startDate": dateStart
    };

    final response = await client
        .post(Uri.parse(getAllVignetteProductFilterApi),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(requestBody))
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["products"];
      List<VignetteProduct> vignetteProductList = List<VignetteProduct>.from(
          l.map((model) => VignetteProduct.fromJson(model)));
      return vignetteProductList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PriceVehicle>> getAllVehicles() async {
    final response = await client.get(
      Uri.parse(getAllVehiclesApi),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["vehicles"];
      List<PriceVehicle> listVehicle = List<PriceVehicle>.from(
        l.map((model) => PriceVehicle.fromJson(model)),
      );
      return listVehicle;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CountryMapModel>> getCountriesMap() async {
    Map<String, String>? queryParams = {
      "populate[0]": "range_section.range_card.image",
      "populate[1]": "range_section.image_slider",
      "locale": "en",
    };

    final response = await client.get(
      Uri.https(contentDomainApi, mapsApi, queryParams),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)['data']["attributes"]
          ['range_section']['image_slider']['data'];
      List<CountryMapModel> countriesModel = List<CountryMapModel>.from(
        l.map((model) => CountryMapModel.fromJson(model)),
      );

      return countriesModel;
    } else {
      throw ServerException();
    }
  }
}
