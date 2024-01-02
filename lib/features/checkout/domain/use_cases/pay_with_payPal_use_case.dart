import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/checkout/domain/repository/app_payment_repository.dart';

class PayWithPayPalUseCase implements UseCase<String?, PayWithPayPalPrams> {
  final AppPaymentRepository repository;

  PayWithPayPalUseCase({required this.repository});

  @override
  Future<Either<Failure, String?>> call(PayWithPayPalPrams params) async {
    return await repository.payWithPayPal(
        amount: params.amount,
        currency: params.currency,
        context: params.context);
  }
}

class PayWithPayPalPrams extends Equatable {
  final String amount;
  final String currency;
  final BuildContext context;

  const PayWithPayPalPrams(
      {required this.amount, required this.currency, required this.context});

  @override
  List<Object?> get props => [amount, currency];
}
