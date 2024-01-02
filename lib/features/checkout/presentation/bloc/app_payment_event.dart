part of 'app_payment_bloc.dart';

@immutable
abstract class AppPaymentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PayWithStripeEvent extends AppPaymentEvent {
  final String amount;
  final String currency;
  final String customerId;

  PayWithStripeEvent(
      {required this.amount, required this.currency, required this.customerId});

  @override
  List<Object?> get props => [amount, currency, customerId];
}

class PayWithPayPalEvent extends AppPaymentEvent {
  final String amount;
  final String currency;
  final BuildContext context;

  PayWithPayPalEvent(
      {required this.amount, required this.currency, required this.context});

  @override
  List<Object?> get props => [amount, currency, context];
}

class ConfirmPaymentApiEvent extends AppPaymentEvent {
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

  ConfirmPaymentApiEvent({
    required this.type,
    required this.customerId,
    required this.card,
    required this.pateLicenceCodeCountry,
    required this.pateLicence,
    required this.pateLicenceRegEx,
    required this.status,
    required this.sessionId,
    required this.language,
    required this.cart,
  });

  @override
  List<Object?> get props => [
        type,
        customerId,
        card,
        pateLicenceCodeCountry,
        pateLicence,
        pateLicenceRegEx,
        status,
        sessionId,
        language,
        cart
      ];
}
