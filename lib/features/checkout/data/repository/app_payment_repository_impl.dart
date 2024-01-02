import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/features/cart_tab/data/data_sources/cart_local_data_sources.dart';
import 'package:tollhopper/features/checkout/data/data_sources/app_payment_remote_data_source.dart';
import 'package:tollhopper/features/checkout/domain/repository/app_payment_repository.dart';

class AppPaymentRepositoryImpl implements AppPaymentRepository {
  final NetworkInfo networkInfo;
  final AppPaymentRemoteDataSource appPaymentRemoteDataSource;
  final CartLocalDataDataSource cartLocalDataDataSource;

  AppPaymentRepositoryImpl(
      {required this.networkInfo,
      required this.appPaymentRemoteDataSource,
      required this.cartLocalDataDataSource});

  @override
  Future<Either<Failure, String?>> payWithStripe(
      {required String amount,
      required String currency,
      required String customerId}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final paymentIntentData =
          await appPaymentRemoteDataSource.createPaymentIntent(
              amount: amount, currency: currency, customerId: customerId);

      await appPaymentRemoteDataSource.makePayment(
          paymentIntentData: paymentIntentData);

      await appPaymentRemoteDataSource.displayPaymentSheet();
      return Right(paymentIntentData["id"]);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> payWithPayPal(
      {required String amount,
      required String currency,
      required BuildContext context}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final paymentIntentData = await appPaymentRemoteDataSource.payPalPayment(
          amount: amount, currency: currency, context: context);
      if (paymentIntentData != null) {
        if (paymentIntentData["status"] == "success") {
          return Right(paymentIntentData["paymentId"]);
        } else {
          return Left(ServerFailure());
        }
      }
      return Left(ServerFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmPayment(
      {required Map<String, dynamic> paymentMap}) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final unit = await appPaymentRemoteDataSource.confirmPayment(
          confirmPaymentBody: paymentMap);
      await cartLocalDataDataSource.removeCart();
      return Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
