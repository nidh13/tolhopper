import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/features/my_vignettes/data/data_sources/vignettes_remote_data_source.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/features/my_vignettes/domain/repository/vignette_repository.dart';

class VignettesRepositoryImpl implements VignetteRepository {
  final NetworkInfo networkInfo;
  final VignettesRemoteDataSource vignettesRemoteDataSource;

  VignettesRepositoryImpl({
    required this.networkInfo,
    required this.vignettesRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<VignetteModel>>> getAllVignettes({
    required String language,
    required String token,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final list = await vignettesRemoteDataSource.getAllVignettes(
          language: language, token: token);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
