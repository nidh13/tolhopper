part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithCredEvent extends SignInEvent {
  final String email;
  final String password;
  final bool stayLogin;

  SignInWithCredEvent(
      {required this.email, required this.password, required this.stayLogin});

  @override
  List<Object?> get props => [email, password, stayLogin];
}

class SkipSignInUpEvent extends SignInEvent {}

class GetUserTokenEvent extends SignInEvent {}

class GetSplashScreenTestParamsEvent extends SignInEvent {}

class GetLoginStateEvent extends SignInEvent {}

class SignUpWithCredEvent extends SignInEvent {
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
  final bool guest;

  SignUpWithCredEvent({
    required this.email,
    required this.password,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    this.postalCode,
    this.companyName,
    this.address,
    this.country,
    this.city,
    this.houseNumber,
    required this.guest,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        firstName,
        lastName,
        gender,
        countryCode,
        companyName,
        country,
        address,
        city,
        houseNumber,
        postalCode,
        guest,
      ];
}

class RestPasswordEvent extends SignInEvent {
  final String email;
  final String languageCode;

  RestPasswordEvent({required this.email, required this.languageCode});

  @override
  List<Object?> get props => [email, languageCode];
}

class LogoutEvent extends SignInEvent {}

class GetUserByIdEvent extends SignInEvent {
  final String token;

  GetUserByIdEvent({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}

class GetUserEvent extends SignInEvent {}

class UpdateUserByIdEvent extends SignInEvent {
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

  UpdateUserByIdEvent(
      {required this.id,
      required this.gender,
      required this.firstName,
      required this.lastName,
      required this.postalCode,
      required this.city,
      required this.houseNumber,
      required this.address,
      required this.companyName,
      required this.country,
      required this.userModel});

  @override
  List<Object?> get props => [
        id,
        gender,
        firstName,
        lastName,
        postalCode,
        city,
        houseNumber,
        address,
        companyName,
        country,
        userModel
      ];
}
