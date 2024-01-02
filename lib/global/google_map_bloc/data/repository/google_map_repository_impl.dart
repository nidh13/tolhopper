import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/global/google_map_bloc/data/data_sources/google_maps_remote_data_sources.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';
import 'package:tollhopper/global/google_map_bloc/domain/repository/google_maps_repository.dart';

class GoogleMapsRepositoryImpl implements GoogleMapsRepository {
  final NetworkInfo networkInfo;
  final GoogleMapsRemoteDataSource googleMapsRemoteDataSource;

  GoogleMapsRepositoryImpl(
      {required this.networkInfo, required this.googleMapsRemoteDataSource});
  @override
  Future<Either<Failure, List<PredictionModel>>> autoCompletePlace(
      {required String text, required String languageCode}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final list = await googleMapsRemoteDataSource.autoCompletePlace(
          text: text, languageCode: languageCode);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppLocation>> getPaceDetails(
      {required String id}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final location = await googleMapsRemoteDataSource.getPaceDetails(id: id);
      return Right(location);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
