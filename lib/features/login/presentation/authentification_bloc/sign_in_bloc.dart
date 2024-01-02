import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/login/domain/use_cases/get_splash_screen_params_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/get_user_by_id_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/get_user_token_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/logout_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/reset_password_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/sing_up_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/skip_sign_in_sing_up_use_case.dart';
import 'package:tollhopper/features/login/domain/use_cases/update_user_by_id_use_case.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SkipSignInUpUseCase skipSignInUpUseCase;
  final GetSplashScreenParamsUseCase getSplashScreenParamsUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogOutUseCase logOutUseCase;
  final GetUserTokenUseCase getUserTokenUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;
  final UpdateUserByIdUseCase updateUserByIdUseCase;
  SignInBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.skipSignInUpUseCase,
    required this.getSplashScreenParamsUseCase,
    required this.resetPasswordUseCase,
    required this.logOutUseCase,
    required this.getUserTokenUseCase,
    required this.getUserByIdUseCase,
    required this.updateUserByIdUseCase,
  }) : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInWithCredEvent) {
      yield SignInLoading();
      final tokenOrFailure = await signInUseCase(SignInPrams(
          email: event.email,
          password: event.password,
          stayLogin: event.stayLogin));
      yield tokenOrFailure.fold(
        (failure) => SignInError(
            message: mapFailureToMessage(failure),
            isInternetFailure: (failure.runtimeType == ConnexionFailure),
            isCredentialFailure: (failure.runtimeType == WrongEmailOrPassword)),
        (token) => SignInSuccess(token: token),
      );
    } else if (event is SignUpWithCredEvent) {
      yield SignInLoading();
      final userCredentialOrFailure = await signUpUseCase(SignUpPrams(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          gender: event.gender,
          lastName: event.lastName,
          countryCode: event.countryCode,
          city: event.city,
          houseNumber: event.houseNumber,
          address: event.address,
          companyName: event.companyName,
          country: event.country,
          postalCode: event.postalCode,
          isGuest: event.guest));
      yield userCredentialOrFailure.fold(
        (failure) => SignInError(
            message: mapFailureToMessage(failure),
            isInternetFailure: (failure.runtimeType == ConnexionFailure),
            isCredentialFailure: (failure.runtimeType == UserExistFailure)),
        (user) => SignUpSuccess(usersModel: user),
      );
    } else if (event is SkipSignInUpEvent) {
      final unitOrFailure = await skipSignInUpUseCase(NoParams());
      yield unitOrFailure.fold(
        (failure) => SignInError(message: mapFailureToMessage(failure)),
        (unit) => SignInUpSkippedState(),
      );
    } else if (event is GetSplashScreenTestParamsEvent) {
      final paramsOrFailure = await getSplashScreenParamsUseCase(NoParams());
      yield paramsOrFailure.fold(
        (failure) => SignInError(message: mapFailureToMessage(failure)),
        (params) => SplashScreenParamsLoadedState(params: params),
      );
    } else if (event is GetLoginStateEvent) {
      yield SignInLoading();
      final unitOrFailure = await getUserTokenUseCase(NoParams());
      yield unitOrFailure.fold(
        (failure) => SignInError(message: mapFailureToMessage(failure)),
        (token) => (token != null) ? IsLoginState() : IsNotLoginState(),
      );
    } else if (event is LogoutEvent) {
      yield SignInLoading();
      final unitOrFailure = await logOutUseCase(NoParams());
      yield unitOrFailure.fold(
        (failure) => SignInError(message: mapFailureToMessage(failure)),
        (unit) => LogOutState(),
      );
    } else if (event is GetUserTokenEvent) {
      yield SignInLoading();
      final unitOrFailure = await getUserTokenUseCase(NoParams());
      yield unitOrFailure.fold(
        (failure) => SignInError(message: mapFailureToMessage(failure)),
        (token) => UserTokenState(token: token),
      );
    } else if (event is GetUserByIdEvent) {
      yield GetUserLoading();
      final unitOrFailure =
          await getUserByIdUseCase(GetUserByIdPrams(token: event.token));
      yield unitOrFailure.fold(
        (failure) => GetUserError(
            message: mapFailureToMessage(failure),
            isInternetFailure: (failure.runtimeType == ConnexionFailure)),
        (userModel) => UserLoadedState(userModel: userModel),
      );
    } else if (event is UpdateUserByIdEvent) {
      yield SignInLoading();
      final unitOrFailure = await updateUserByIdUseCase(UpdateUserByIdPrams(
          id: event.id,
          city: event.city,
          houseNumber: event.houseNumber,
          address: event.address,
          companyName: event.companyName,
          country: event.country,
          postalCode: event.postalCode,
          gender: event.gender,
          firstName: event.firstName,
          lastName: event.lastName,
          userModel: event.userModel));
      yield unitOrFailure.fold(
        (failure) => UpdateUserError(
            message: mapFailureToMessage(failure),
            isInternetFailure: (failure.runtimeType == ConnexionFailure),
            isCredentialFailure: (failure.runtimeType == UserNotExistFailure)),
        (userModel) => UserUpdatedState(userModel: userModel),
      );
    } else if (event is RestPasswordEvent) {
      yield SignInLoading();
      final tokenOrFailure = await resetPasswordUseCase(ResetPasswordPrams(
          email: event.email, languageCode: event.languageCode));
      yield tokenOrFailure.fold(
        (failure) => SignInError(message: mapFailureToMessage(failure)),
        (token) => ResetPasswordEmailSendState(),
      );
    } else if (event is GetUserEvent) {
      yield SignInLoading();
      final unitOrFailure = await getUserTokenUseCase(NoParams());
      yield* unitOrFailure.fold(
        (failure) async* {
          yield GetUserError(message: mapFailureToMessage(failure));
        },
        (token) async* {
          if (token == null) {
            yield GetUserError(
                message: LocaleKeys.server_unAuthenticate_exception.tr());
          }
          final unitOrFailure =
              await getUserByIdUseCase(GetUserByIdPrams(token: token!));
          yield unitOrFailure.fold(
            (failure) => GetUserError(
                message: mapFailureToMessage(failure),
                isInternetFailure: (failure.runtimeType == ConnexionFailure)),
            (userModel) => UserLoadedState(userModel: userModel),
          );
        },
      );
    }
  }
}
