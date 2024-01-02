import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/error/failures.dart';

abstract class AppPaymentRepository {
  Future<Either<Failure, String?>> payWithStripe({
    required String amount,
    required String currency,
    required String customerId,
  });
  Future<Either<Failure, String?>> payWithPayPal({
    required String amount,
    required String currency,
    required BuildContext context,
  });

  Future<Either<Failure, Unit>> confirmPayment({
    required Map<String, dynamic> paymentMap,
  });
}
