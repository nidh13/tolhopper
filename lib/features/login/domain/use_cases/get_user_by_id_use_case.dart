import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

import '../../../../core/error/failures.dart';

class GetUserByIdUseCase implements UseCase<UserModel, GetUserByIdPrams> {
  final SignInUpRepository repository;

  GetUserByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(GetUserByIdPrams params) async {
    return await repository.getUserById(token: params.token);
  }
}

class GetUserByIdPrams extends Equatable {
  final String token;

  const GetUserByIdPrams({
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
      ];
}
