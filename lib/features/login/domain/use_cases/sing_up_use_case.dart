import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';

class SignUpUseCase implements UseCase<UserModel, SignUpPrams> {
  final SignInUpRepository repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(SignUpPrams signUpPrams) async {
    return await repository.signUp(
        email: signUpPrams.email,
        lastName: signUpPrams.lastName,
        gender: signUpPrams.gender,
        firstName: signUpPrams.firstName,
        countryCode: signUpPrams.countryCode,
        password: signUpPrams.password,
        isGuest: signUpPrams.isGuest,
        postalCode: signUpPrams.postalCode,
        country: signUpPrams.country,
        companyName: signUpPrams.companyName,
        address: signUpPrams.address,
        houseNumber: signUpPrams.houseNumber,
        city: signUpPrams.city);
  }
}

class SignUpPrams extends Equatable {
  final String email;
  final String password;
  final String gender;
  final String firstName;
  final String lastName;
  final String countryCode;
  final String? companyName;
  final String? country;
  final String? address;
  final String? city;
  final String? houseNumber;
  final String? postalCode;
  final bool isGuest;

  const SignUpPrams(
      {required this.email,
      required this.gender,
      required this.lastName,
      required this.firstName,
      required this.password,
      required this.countryCode,
      required this.houseNumber,
      required this.city,
      required this.country,
      required this.address,
      required this.companyName,
      required this.postalCode,
      required this.isGuest});

  @override
  List<Object?> get props => [
        email,
        password,
        gender,
        firstName,
        lastName,
        countryCode,
        companyName,
        country,
        address,
        city,
        houseNumber,
        postalCode,
        isGuest,
      ];
}
