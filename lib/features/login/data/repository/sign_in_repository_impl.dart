import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/features/cart_tab/data/data_sources/cart_local_data_sources.dart';
import 'package:tollhopper/features/login/data/data_sources/sign_in_up_local_data_sources.dart';
import 'package:tollhopper/features/login/data/data_sources/sign_in_up_remote_data_sources.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/domain/repository/sign_in_repository.dart';
import 'package:tollhopper/features/login/domain/use_cases/get_splash_screen_params_use_case.dart';
import 'package:tollhopper/global/utils/functions.dart';

class SignInUpRepositoryImpl implements SignInUpRepository {
  final NetworkInfo networkInfo;
  final SignInUpRemoteDataSource signInUpRemoteDataSource;
  final SignInUpLocalDataDataSource signInUpLocalDataDataSource;
  final CartLocalDataDataSource cartLocalDataDataSource;

  SignInUpRepositoryImpl(
      {required this.networkInfo,
      required this.signInUpRemoteDataSource,
      required this.signInUpLocalDataDataSource,
      required this.cartLocalDataDataSource});

  @override
  Future<Either<Failure, String>> signIn(
      {required String email,
      required String password,
      required bool stayLogin}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final token = await signInUpRemoteDataSource.signIn(
          password: password, email: email);
      await signInUpLocalDataDataSource.stayLogin(value: stayLogin);
      await signInUpLocalDataDataSource.saveToken(token: token);
      return Right(token);
    } on ServerException {
      return Left(ServerFailure());
    } on WrongCredentialException {
      return Left(WrongEmailOrPassword());
    }
  }

  @override
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
      required bool isGuest}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      if (isGuest) {
        final user = await signInUpRemoteDataSource.guestRegister(
          email: email,
          lastName: lastName,
          gender: gender,
          firstName: firstName,
          languageCode: countryCode,
          city: city,
          houseNumber: houseNumber,
          address: address,
          companyName: companyName,
          country: country,
          postalCode: postalCode,
          isGuest: isGuest,
        );
        return Right(user);
      } else {
        final user = await signInUpRemoteDataSource.signUp(
          password: password,
          email: email,
          lastName: lastName,
          gender: gender,
          firstName: firstName,
          languageCode: countryCode,
          city: city,
          houseNumber: houseNumber,
          address: address,
          companyName: companyName,
          country: country,
          postalCode: postalCode,
        );
        return Right(user);
      }
    } on ServerException {
      return Left(ServerFailure());
    } on UserExistException {
      return Left(UserExistFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> skipSignInUp() async {
    try {
      await signInUpLocalDataDataSource.skip(value: true);
      return const Right(unit);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, GetSplashScreenParams>> getSplashScreenParams() async {
    try {
      final skip = await signInUpLocalDataDataSource.getSkip();
      final stayLogin = await signInUpLocalDataDataSource.getStayLogin();
      return Right(GetSplashScreenParams(stayLogin: stayLogin, skipped: skip));
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
      {required String email, required String languageCode}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final token = await signInUpRemoteDataSource.restPassword(
          email: email, languageCode: languageCode);
      return Right(token);
    } on ServerException {
      return Left(ServerFailure());
    } on UserNotExistException {
      return Left(UserNotExistFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await signInUpLocalDataDataSource.removeStayLogin();
      await signInUpLocalDataDataSource.removeToken();
      await cartLocalDataDataSource.removeCart();
      return const Right(unit);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await signInUpLocalDataDataSource.getToken();
      return Right(token);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(
      {required String token}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      String userId = getCustomerIdFromBackendToken(token);
      final userModel =
          await signInUpRemoteDataSource.getUserById(token: userId);
      return Right(userModel);
    } on ServerException {
      return Left(ServerFailure());
    } on UserNotExistException {
      return Left(UserNotExistFailure());
    }
  }

  @override
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
      required UserModel userModel}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final response = await signInUpRemoteDataSource.updateUserModel(
          city: city,
          houseNumber: houseNumber,
          address: address,
          companyName: companyName,
          country: country,
          postalCode: postalCode,
          gender: gender,
          firstName: firstName,
          lastName: lastName,
          id: id,
          userModel: userModel);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } on UserNotExistException {
      return Left(UserNotExistFailure());
    }
  }
}
