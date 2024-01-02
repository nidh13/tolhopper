import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class ResetPasswordUseCase implements UseCase<Unit, ResetPasswordPrams> {
  final SignInUpRepository repository;

  ResetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(
      ResetPasswordPrams resetPasswordPrams) async {
    return await repository.resetPassword(
        email: resetPasswordPrams.email,
        languageCode: resetPasswordPrams.languageCode);
  }
}

class ResetPasswordPrams extends Equatable {
  final String email;
  final String languageCode;

  const ResetPasswordPrams({required this.email, required this.languageCode});

  @override
  List<Object?> get props => [email, languageCode];
}
