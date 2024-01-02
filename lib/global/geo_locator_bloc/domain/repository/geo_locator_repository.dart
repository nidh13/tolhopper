import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tollhopper/core/error/failures.dart';

abstract class GeoLocatorRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
}
