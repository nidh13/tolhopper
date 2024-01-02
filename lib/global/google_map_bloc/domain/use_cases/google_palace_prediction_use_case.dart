import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';
import 'package:tollhopper/global/google_map_bloc/domain/repository/google_maps_repository.dart';

class GooglePlacesPredictionUseCase
    implements UseCase<List<PredictionModel>, GooglePlacesPredictionPrams> {
  final GoogleMapsRepository repository;

  GooglePlacesPredictionUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PredictionModel>>> call(
      GooglePlacesPredictionPrams params) async {
    return await repository.autoCompletePlace(
        text: params.text, languageCode: params.languageCode);
  }
}

class GooglePlacesPredictionPrams extends Equatable {
  final String text;
  final String languageCode;

  const GooglePlacesPredictionPrams(
      {required this.text, required this.languageCode});

  @override
  List<Object?> get props => [text, languageCode];
}
