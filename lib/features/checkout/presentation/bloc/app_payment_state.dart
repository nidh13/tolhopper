part of 'app_payment_bloc.dart';

@immutable
abstract class AppPaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppPaymentInitial extends AppPaymentState {}

class AppPaymentLoading extends AppPaymentState {}

class AppPaymentPackageLoading extends AppPaymentState {}

class AppPaymentError extends AppPaymentState {
  final String message;
  final bool isInternetFailure;
  final String type;

  AppPaymentError({required this.message, required this.isInternetFailure,required this.type});

  @override
  List<Object?> get props => [message, isInternetFailure,type];
}

class StripePaymentError extends AppPaymentState {
  final String message;
  final bool isInternetFailure;

  StripePaymentError({required this.message, required this.isInternetFailure});

  @override
  List<Object?> get props => [message, isInternetFailure];
}

class PayPalPaymentError extends AppPaymentState {
  final String message;
  final bool isInternetFailure;

  PayPalPaymentError({required this.message, required this.isInternetFailure});

  @override
  List<Object?> get props => [message, isInternetFailure];
}

class AppPaymentSuccess extends AppPaymentState {}

class StripePaymentSuccess extends AppPaymentState {
  final String? intentId;

  StripePaymentSuccess({required this.intentId});

  @override
  List<Object?> get props => [intentId];
}

class PaypalPaymentSuccess extends AppPaymentState {
  final String? paymentId;

  PaypalPaymentSuccess({required this.paymentId});

  @override
  List<Object?> get props => [paymentId];
}
