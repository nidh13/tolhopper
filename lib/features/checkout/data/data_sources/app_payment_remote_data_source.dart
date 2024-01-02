import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/app_keys.dart';
import 'dart:developer';

abstract class AppPaymentRemoteDataSource {
  Future<Map<String, dynamic>> createPaymentIntent(
      {required String amount,
      required String currency,
      required String customerId});
  Future<Map<String, dynamic>> makePayment(
      {required Map<String, dynamic> paymentIntentData});
  Future<void> displayPaymentSheet();

  Future<PaymentIntent> retrievePaymentIntent(
      {required Map<String, dynamic> paymentIntentData});
  Future<Map<String, dynamic>?> payPalPayment(
      {required String amount,
      required String currency,
      required BuildContext context});

  Future<Unit> confirmPayment(
      {required Map<String, dynamic> confirmPaymentBody});
}

class AppPaymentRemoteDataSourceImpl extends AppPaymentRemoteDataSource {
  final http.Client client;

  AppPaymentRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> makePayment(
      {required Map<String, dynamic> paymentIntentData}) async {
    log(paymentIntentData.toString());
    try {
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        applePay: false,
        googlePay: false,
        merchantDisplayName: "Toll Hopper",
        customerId: paymentIntentData['customer'],
        paymentIntentClientSecret: paymentIntentData['client_secret'],
        customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
      ));
      return paymentIntentData;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on Exception catch (e) {
      if (e is StripeException) {
        /// to do add exeption
        throw ServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Map<String, dynamic>> createPaymentIntent(
      {required String amount,
      required String currency,
      required String customerId}) async {
    calculateAmount(amount);
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $stripePrivateLiveKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      throw ServerException();
    }
  }

  calculateAmount(String amount) {
    final a = (double.parse(amount)) * 100;
    return a.toStringAsFixed(0);
  }

  @override
  Future<Map<String, dynamic>?> payPalPayment(
      {required String amount,
      required String currency,
      required BuildContext context}) async {
    Completer<Map<String, dynamic>?> completer =
        Completer<Map<String, dynamic>>();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(

            /// to test
            // sandboxMode: true,
            clientId: payPalLiveClientId,
            secretKey: payPalLiveSecretId,
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [
              {
                "amount": {
                  "total": amount,
                  "currency": currency,
                  "details": {
                    "subtotal": amount,
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "transaction from app.",
                // "payment_options": {
                //   "allowed_payment_method":
                //       "INSTANT_FUNDING_SOURCE"
                // },
                // "item_list": {
                //   "items": const[
                //     {
                //       "name": "A demo product",
                //       "quantity": 1,
                //       "price": '10.12',
                //       "currency": "USD"
                //     }
                //   ],
                //
                //   // shipping address is not required though
                //   // "shipping_address": {
                //   //   "recipient_name": "Jane Foster",
                //   //   "line1": "Travis County",
                //   //   "line2": "",
                //   //   "city": "Austin",
                //   //   "country_code": "US",
                //   //   "postal_code": "73301",
                //   //   "phone": "+00000000",
                //   //   "state": "Texas"
                //   // },
                // }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              // Convert the received Map to Map<String, dynamic>
              Map<String, dynamic> convertedParams =
                  Map<String, dynamic>.from(params);
              // Complete the Completer with the converted payment parameters
              completer.complete(convertedParams);
            },
            onError: (error) {
              // completer.complete(null);
            },
            onCancel: (params) async {
              // completer.complete(null);
            }),
      ),
    );
    return completer.future;
  }

  @override
  Future<Unit> confirmPayment(
      {required Map<String, dynamic> confirmPaymentBody}) async {
    log(jsonEncode(confirmPaymentBody));
    final response = await client.post(
      Uri.parse(orderCreate),
      body: jsonEncode(confirmPaymentBody),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PaymentIntent> retrievePaymentIntent(
      {required Map<String, dynamic> paymentIntentData}) async {
    try {
      return await Stripe.instance
          .retrievePaymentIntent(paymentIntentData["id"]);
    } on Exception catch (e) {
      if (e is StripeException) {
        /// to do add exeption
        throw ServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
