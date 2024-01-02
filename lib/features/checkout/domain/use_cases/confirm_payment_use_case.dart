import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/checkout/domain/repository/app_payment_repository.dart';
import 'package:tollhopper/global/utils/const.dart';
import 'package:tollhopper/global/utils/functions.dart';

class ConfirmPaymentUseCase implements UseCase<Unit, ConfirmPaymentParams> {
  final AppPaymentRepository repository;

  ConfirmPaymentUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(ConfirmPaymentParams params) async {
    return await repository.confirmPayment(paymentMap: params.toJson());
  }
}

class ConfirmPaymentParams extends Equatable {
  final String type;
  final String language;
  final String status;
  final String customerId;
  final String sessionId;
  final String pateLicence;
  final String pateLicenceRegEx;
  final String pateLicenceCodeCountry;
  final List<CartModel> cart;
  final String? card;

  const ConfirmPaymentParams({
    required this.type,
    required this.language,
    required this.status,
    required this.customerId,
    required this.sessionId,
    required this.cart,
    required this.pateLicence,
    required this.pateLicenceRegEx,
    required this.pateLicenceCodeCountry,
    required this.card,
  });

  @override
  List<Object?> get props =>
      [type, language, status, customerId, sessionId, cart];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    Map<String, dynamic> payment = new Map<String, dynamic>();
    data["is_from_mobile"] = true;
    data["language"] = language;
    data["status"] = status;
    data["customer_id"] = customerId;

    List<Map<String, dynamic>> mapList = [];

    for (var cartItem in cart) {
      Map<String, dynamic> orderDetailsElement = new Map<String, dynamic>();
      Map<String, dynamic> routeElement = new Map<String, dynamic>();
      if (cartItem.tollGruDuration != null) {
        routeElement["duration"] = cartItem.tollGruDuration;
      }
      if (cartItem.googleUrl != null) {
        routeElement["google_url"] = cartItem.googleUrl;
      }
      if (cartItem.countries != null) {
        routeElement["countries"] = cartItem.countries;
      }
      if (cartItem.countries != null ||
          cartItem.tollGruDuration != null ||
          cartItem.googleUrl != null) {
        orderDetailsElement["route"] = routeElement;
      }
      orderDetailsElement["product_id"] = cartItem.productId;
      orderDetailsElement["price_id"] = cartItem.priceId;
      orderDetailsElement["type"] = cartItem.productType;
      if (cartItem.vehicleId != null) {
        orderDetailsElement["vehicle_id"] = cartItem.vehicleId;
      }
      if (cartItem.dateStart != null) {
        orderDetailsElement["start_date"] = cartItem.dateStart ??
            convertDateFormat(DateFormat(dateFormat).format(DateTime.now()));
      }
      orderDetailsElement["immatricule"] = pateLicence.toUpperCase();
      orderDetailsElement["immatricule_regex"] = pateLicence.toUpperCase();
      orderDetailsElement["immatricule_country"] = pateLicenceCodeCountry;
      mapList.add(orderDetailsElement);
    }
    data["order_details"] = mapList;
    payment["cart"] = card ?? "";
    payment["methode"] = type;
    payment["session_id"] = sessionId;
    data["payment"] = payment;
    return data;
  }
}
