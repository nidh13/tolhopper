import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/global/geo_locator_bloc/domain/repository/geo_locator_repository.dart';

class GetCurrentPositionUseCase implements UseCase<Position, NoParams> {
  final GeoLocatorRepository repository;

  GetCurrentPositionUseCase({required this.repository});

  @override
  Future<Either<Failure, Position>> call(NoParams params) async {
    return await repository.getCurrentLocation();
  }
}
