import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/global/geo_locator_bloc/data/data_sources/geo_locator_data_source.dart';
import 'package:tollhopper/global/geo_locator_bloc/domain/repository/geo_locator_repository.dart';

class GeoLocatorRepositoryImpl implements GeoLocatorRepository {
  final NetworkInfo networkInfo;
  final GeoLocatorDataSource geoLocatorDataSource;

  GeoLocatorRepositoryImpl({
    required this.geoLocatorDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final permission = await geoLocatorDataSource.checkLocationPermission();
      if (permission) {
        final position = await geoLocatorDataSource.getCurrentLocation();
        if (position != null) {
          return Right(position);
        }
      }
      return Left(LocationFailure());
    } on LocationException {
      return Left(LocationFailure());
    } on LocationDeniedForeverException {
      return Left(LocationFailure());
    }
  }
}
