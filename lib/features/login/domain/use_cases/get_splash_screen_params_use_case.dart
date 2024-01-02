import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class GetSplashScreenParamsUseCase
    implements UseCase<GetSplashScreenParams, NoParams> {
  final SignInUpRepository repository;

  GetSplashScreenParamsUseCase({required this.repository});

  @override
  Future<Either<Failure, GetSplashScreenParams>> call(NoParams noParams) async {
    return await repository.getSplashScreenParams();
  }
}

class GetSplashScreenParams extends Equatable {
  final bool skipped;
  final bool stayLogin;

  const GetSplashScreenParams({
    required this.skipped,
    required this.stayLogin,
  });

  @override
  List<Object?> get props => [skipped, stayLogin];

  String getPathToGo() {
    if (skipped || stayLogin) {
      return homePage;
    }
    return loginPage;
  }
}
