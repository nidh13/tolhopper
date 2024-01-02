import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';

abstract class VignetteRepository {
  Future<Either<Failure, List<VignetteModel>>> getAllVignettes({
    required String language,
    required String token,
  });
}
