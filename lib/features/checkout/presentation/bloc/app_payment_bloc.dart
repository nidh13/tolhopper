import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/checkout/domain/use_cases/confirm_payment_use_case.dart';
import 'package:tollhopper/features/checkout/domain/use_cases/pay_with_payPal_use_case.dart';
import 'package:tollhopper/features/checkout/domain/use_cases/pay_with_stripe_use_case.dart';
import 'package:tollhopper/global/utils/functions.dart';

part 'app_payment_event.dart';
part 'app_payment_state.dart';

class AppPaymentBloc extends Bloc<AppPaymentEvent, AppPaymentState> {
  final PayWithStripeUseCase payWithStripeUseCase;
  final PayWithPayPalUseCase payWithPayPalUseCase;
  final ConfirmPaymentUseCase confirmPaymentUseCase;
  AppPaymentBloc(
      {required this.payWithStripeUseCase,
      required this.payWithPayPalUseCase,
      required this.confirmPaymentUseCase})
      : super(AppPaymentInitial());
  @override
  Stream<AppPaymentState> mapEventToState(
    AppPaymentEvent event,
  ) async* {
    if (event is PayWithStripeEvent) {
      yield AppPaymentPackageLoading();
      final intentIdOrFailure = await payWithStripeUseCase(
          PayWithStripeUsePrams(
              currency: event.currency,
              amount: event.amount,
              customerId: event.customerId));
      yield intentIdOrFailure.fold(
        (failure) => StripePaymentError(
            message: mapFailureToMessage(failure),
            isInternetFailure: (failure.runtimeType == ConnexionFailure)),
        (intentId) => StripePaymentSuccess(intentId: intentId),
      );
    } else if (event is PayWithPayPalEvent) {
      final paymentIdOrFailure = await payWithPayPalUseCase(PayWithPayPalPrams(
          currency: event.currency,
          amount: event.amount,
          context: event.context));
      yield paymentIdOrFailure.fold(
        (failure) => PayPalPaymentError(
            message: mapFailureToMessage(failure),
            isInternetFailure: (failure.runtimeType == ConnexionFailure)),
        (paymentId) => PaypalPaymentSuccess(paymentId: paymentId),
      );
    } else if (event is ConfirmPaymentApiEvent) {
      yield AppPaymentLoading();
      final unitOrFailure = await confirmPaymentUseCase(
        ConfirmPaymentParams(
          customerId: event.customerId,
          sessionId: event.sessionId,
          status: event.status,
          language: event.language,
          type: event.type,
          cart: event.cart,
          card: event.card,
          pateLicence: event.pateLicence,
          pateLicenceCodeCountry: event.pateLicenceCodeCountry,
          pateLicenceRegEx: event.pateLicenceRegEx,
        ),
      );
      yield unitOrFailure.fold(
        (failure) => AppPaymentError(
            message: mapFailureToMessage(failure),
            type: event.type,
            isInternetFailure: (failure.runtimeType == ConnexionFailure)),
        (token) => AppPaymentSuccess(),
      );
    }
  }
}
