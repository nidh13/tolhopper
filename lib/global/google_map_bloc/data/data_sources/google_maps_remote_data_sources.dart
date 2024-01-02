import 'dart:convert';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';
import 'package:http/http.dart' as http;
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/app_keys.dart';
import 'package:uuid/uuid.dart';

abstract class GoogleMapsRemoteDataSource {
  Future<List<PredictionModel>> autoCompletePlace(
      {required String text, required String languageCode});
  Future<AppLocation> getPaceDetails({required String id});
}

class GoogleMapsRemoteDataSourceImpl extends GoogleMapsRemoteDataSource {
  final http.Client client;

  GoogleMapsRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PredictionModel>> autoCompletePlace(
      {required String text, required String languageCode}) async {
    final sessionToken = const Uuid().v4();
    String request =
        "$googleApiBaseUrl$googleApiAutoComplete?input=$text&language=$languageCode&key=$googleMapsApi&sessiontoken=$sessionToken";
    final response = await client
        .get(
          Uri.parse(request),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["predictions"];
      List<PredictionModel> predictionModelList = List<PredictionModel>.from(
          l.map((model) => PredictionModel.fromJson(model)));
      return predictionModelList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AppLocation> getPaceDetails({required String id}) async {
    final sessionToken = const Uuid().v4();
    String request =
        "$googleApiBaseUrl$googleApiDetails?place_id=$id&key=$googleMapsApi&sessiontoken=$sessionToken";
    final response = await client
        .get(
          Uri.parse(request),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      return AppLocation.fromJson(
          json.decode(response.body)["result"]["geometry"]["location"]);
    } else {
      throw ServerException();
    }
  }
}
