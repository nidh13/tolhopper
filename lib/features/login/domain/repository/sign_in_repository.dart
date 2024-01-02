import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/domain/use_cases/get_splash_screen_params_use_case.dart';

abstract class SignInUpRepository {
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
    required bool stayLogin,
  });

  Future<Either<Failure, Unit>> skipSignInUp();

  Future<Either<Failure, Unit>> resetPassword(
      {required String email, required String languageCode});

  Future<Either<Failure, UserModel>> signUp(
      {required String email,
      required String password,
      required String gender,
      required String firstName,
      required String lastName,
      required String countryCode,
      required String? companyName,
      required String? country,
      required String? address,
      required String? city,
      required String? houseNumber,
      required String? postalCode,
      required bool isGuest});

  Future<Either<Failure, GetSplashScreenParams>> getSplashScreenParams();

  Future<Either<Failure, Unit>> logOut();

  Future<Either<Failure, String?>> getToken();

  Future<Either<Failure, UserModel>> getUserById({
    required String token,
  });

  Future<Either<Failure, UserModel>> updateUserById(
      {required String id,
      required String? country,
      required String? companyName,
      required String? address,
      required String? houseNumber,
      required String? city,
      required String? postalCode,
      required String? lastName,
      required String? firstName,
      required String? gender,
      required UserModel userModel});
}
