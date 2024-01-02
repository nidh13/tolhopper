import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class SignInUseCase implements UseCase<String, SignInPrams> {
  final SignInUpRepository repository;

  SignInUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignInPrams signInPrams) async {
    return await repository.signIn(
        email: signInPrams.email,
        password: signInPrams.password,
        stayLogin: signInPrams.stayLogin);
  }
}

class SignInPrams extends Equatable {
  final String email;
  final String password;
  final bool stayLogin;

  const SignInPrams(
      {required this.email, required this.password, required this.stayLogin});

  @override
  List<Object?> get props => [email, password, stayLogin];
}
