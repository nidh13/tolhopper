import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/google_map_bloc/domain/repository/google_maps_repository.dart';

class GooglePlacesPredictionDetailsUseCase
    implements UseCase<AppLocation, GooglePlacesPredictionDetailsPrams> {
  final GoogleMapsRepository repository;

  GooglePlacesPredictionDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, AppLocation>> call(
      GooglePlacesPredictionDetailsPrams params) async {
    return await repository.getPaceDetails(id: params.placeId);
  }
}

class GooglePlacesPredictionDetailsPrams extends Equatable {
  final String placeId;

  const GooglePlacesPredictionDetailsPrams({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}
