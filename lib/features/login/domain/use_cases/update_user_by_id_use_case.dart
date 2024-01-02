import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class UpdateUserByIdUseCase implements UseCase<UserModel, UpdateUserByIdPrams> {
  final SignInUpRepository repository;

  UpdateUserByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(UpdateUserByIdPrams params) async {
    return await repository.updateUserById(
        id: params.id,
        lastName: params.lastName,
        firstName: params.firstName,
        gender: params.gender,
        postalCode: params.postalCode,
        country: params.country,
        companyName: params.companyName,
        address: params.address,
        houseNumber: params.houseNumber,
        city: params.city,
        userModel: params.userModel);
  }
}

class UpdateUserByIdPrams extends Equatable {
  final String id;
  final String gender;
  final String firstName;
  final String lastName;
  final String? companyName;
  final String? country;
  final String? address;
  final String? city;
  final String? houseNumber;
  final String? postalCode;
  final UserModel userModel;

  const UpdateUserByIdPrams(
      {required this.id,
      required this.country,
      required this.companyName,
      required this.address,
      required this.houseNumber,
      required this.city,
      required this.postalCode,
      required this.lastName,
      required this.firstName,
      required this.gender,
      required this.userModel});

  @override
  List<Object?> get props => [
        id,
        country,
        companyName,
        address,
        houseNumber,
        city,
        postalCode,
        lastName,
        firstName,
        gender,
        userModel
      ];
}
