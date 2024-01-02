import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class GetUserTokenUseCase implements UseCase<String?, NoParams> {
  final SignInUpRepository repository;

  GetUserTokenUseCase({required this.repository});

  @override
  Future<Either<Failure, String?>> call(NoParams noParams) async {
    return await repository.getToken();
  }
}
