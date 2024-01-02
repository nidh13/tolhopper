part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class GetUserLoading extends SignInState {}

class SignInError extends SignInState {
  final String message;
  final bool isInternetFailure;
  final bool isCredentialFailure;

  SignInError(
      {required this.message,
      this.isInternetFailure = false,
      this.isCredentialFailure = false});

  @override
  List<Object?> get props => [message, isInternetFailure, isCredentialFailure];
}

class GetUserError extends SignInState {
  final String message;
  final bool isInternetFailure;
  final bool isCredentialFailure;

  GetUserError(
      {required this.message,
      this.isInternetFailure = false,
      this.isCredentialFailure = false});

  @override
  List<Object?> get props => [message, isInternetFailure, isCredentialFailure];
}

class UpdateUserError extends SignInState {
  final String message;
  final bool isInternetFailure;
  final bool isCredentialFailure;

  UpdateUserError(
      {required this.message,
      this.isInternetFailure = false,
      this.isCredentialFailure = false});

  @override
  List<Object?> get props => [message, isInternetFailure, isCredentialFailure];
}

class SignInSuccess extends SignInState {
  final String token;

  SignInSuccess({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}

class SplashScreenParamsLoadedState extends SignInState {
  final GetSplashScreenParams params;

  SplashScreenParamsLoadedState({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}

class SignInUpSkippedState extends SignInState {}

class SignUpSuccess extends SignInState {
  final UserModel usersModel;

  SignUpSuccess({
    required this.usersModel,
  });

  @override
  List<Object?> get props => [usersModel];
}

class UserTokenState extends SignInState {
  final String? token;

  UserTokenState({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}

class UserLoadedState extends SignInState {
  final UserModel userModel;

  UserLoadedState({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}

class UserUpdatedState extends SignInState {
  final UserModel userModel;

  UserUpdatedState({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}

class ResetPasswordEmailSendState extends SignInState {}

class LogOutState extends SignInState {}

class IsLoginState extends SignInState {}

class IsNotLoginState extends SignInState {}
