import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/features/my_vignettes/domain/repository/vignette_repository.dart';

class GetVignettesUseCase
    implements UseCase<List<VignetteModel>, GetVignettesParams> {
  final VignetteRepository repository;

  const GetVignettesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<VignetteModel>>> call(
      GetVignettesParams params) async {
    return await repository.getAllVignettes(
      language: params.language,
      token: params.token,
    );
  }
}

class GetVignettesParams extends Equatable {
  final String token;
  final String language;

  const GetVignettesParams({
    required this.token,
    required this.language,
  });

  @override
  List<Object?> get props => [token];
}
