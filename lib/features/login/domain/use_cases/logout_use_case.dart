import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class LogOutUseCase implements UseCase<Unit, NoParams> {
  final SignInUpRepository repository;

  LogOutUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(NoParams noParams) async {
    return await repository.logOut();
  }
}
