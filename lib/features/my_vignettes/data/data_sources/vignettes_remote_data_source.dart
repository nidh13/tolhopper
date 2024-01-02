import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/global/utils/app_api.dart';

abstract class VignettesRemoteDataSource {
  Future<List<VignetteModel>> getAllVignettes({
    required String language,
    required String token,
  });
}

class VignettesRemoteDataSourceImpl extends VignettesRemoteDataSource {
  final http.Client client;

  VignettesRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<VignetteModel>> getAllVignettes(
      {required String language, required String token}) async {
    final Map<String, dynamic> requestBody = {
      'customer_id': token,
      'language': language,
    };

    final response = await client
        .post(
          Uri.parse(globalApiDomain + getVignetteHistory),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        )
        .catchError((e) => throw ServerException());

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)["vignette_list"];
      List<VignetteModel> vignetteProductList = List<VignetteModel>.from(
        l.map((model) => VignetteModel.fromJson(model)),
      );
      return vignetteProductList;
    } else if (response.statusCode == 400) {
      throw UserNotExistException();
    } else {
      throw ServerException();
    }
  }
}
