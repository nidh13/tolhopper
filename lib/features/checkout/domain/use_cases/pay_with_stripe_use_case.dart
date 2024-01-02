import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/checkout/domain/repository/app_payment_repository.dart';

class PayWithStripeUseCase implements UseCase<String?, PayWithStripeUsePrams> {
  final AppPaymentRepository repository;

  PayWithStripeUseCase({required this.repository});

  @override
  Future<Either<Failure, String?>> call(PayWithStripeUsePrams params) async {
    return await repository.payWithStripe(
        amount: params.amount,
        currency: params.currency,
        customerId: params.customerId);
  }
}

class PayWithStripeUsePrams extends Equatable {
  final String amount;
  final String currency;
  final String customerId;

  const PayWithStripeUsePrams(
      {required this.amount, required this.currency, required this.customerId});

  @override
  List<Object?> get props => [amount, currency, customerId];
}
