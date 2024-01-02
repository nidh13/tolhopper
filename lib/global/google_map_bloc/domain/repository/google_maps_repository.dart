import 'package:dartz/dartz.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';

import '../../../../core/error/failures.dart';

abstract class GoogleMapsRepository {
  Future<Either<Failure, List<PredictionModel>>> autoCompletePlace(
      {required String text, required String languageCode});
  Future<Either<Failure, AppLocation>> getPaceDetails({required String id});
}
