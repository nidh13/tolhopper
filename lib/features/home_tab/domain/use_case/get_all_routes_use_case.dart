import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/domain/repository/product_repository.dart';

class GetAllRoutesWithStringLocationsUseCaseCase
    implements
        UseCase<List<TollRoutesModel>, GetAllRoutesWithStringLocationsPrams> {
  final ProductRepository repository;

  GetAllRoutesWithStringLocationsUseCaseCase({required this.repository});

  @override
  Future<Either<Failure, List<TollRoutesModel>>> call(
      GetAllRoutesWithStringLocationsPrams params) async {
    return await repository.getAllRoutesWithWithCountryString(
        destination: params.destination,
        start: params.start,
        destinationLocationId: params.destinationLocationId,
        startLocationId: params.startLocationId);
  }
}

class GetAllRoutesWithStringLocationsPrams extends Equatable {
  final String destination;
  final String start;
  final String? startLocationId;
  final String? destinationLocationId;

  const GetAllRoutesWithStringLocationsPrams(
      {required this.destinationLocationId,
      required this.startLocationId,
      required this.start,
      required this.destination});

  @override
  List<Object?> get props =>
      [destination, start, startLocationId, destinationLocationId];
}
