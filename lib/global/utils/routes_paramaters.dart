import 'package:equatable/equatable.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';

class ContactInformationParams extends Equatable {
  final bool isConnected;
  final String token;
  final String licencePate;
  final String licencePateRegEx;
  final String countryLicencePate;

  const ContactInformationParams({
    required this.isConnected,
    required this.token,
    required this.licencePate,
    required this.licencePateRegEx,
    required this.countryLicencePate,
  });
  @override
  List<Object?> get props => [
        isConnected,
        token,
        licencePate,
        licencePateRegEx,
        countryLicencePate,
      ];
}

class PaymentMethodeParams extends Equatable {
  final UserModel userModel;
  final String token;
  final String licencePate;
  final String licencePateRegEx;
  final String countryLicencePate;
  final String totalAmount;
  final List<CartModel> cart;

  const PaymentMethodeParams({
    required this.userModel,
    required this.token,
    required this.licencePate,
    required this.licencePateRegEx,
    required this.countryLicencePate,
    required this.totalAmount,
    required this.cart,
  });
  @override
  List<Object?> get props => [
        userModel,
        token,
        licencePate,
        licencePateRegEx,
        countryLicencePate,
        totalAmount,
        cart,
      ];
}

class CheckoutPageParams extends Equatable {
  final UserModel userModel;
  final String token;
  final String licencePate;
  final String licencePateRegEx;
  final String countryLicencePate;

  const CheckoutPageParams({
    required this.userModel,
    required this.token,
    required this.licencePate,
    required this.licencePateRegEx,
    required this.countryLicencePate,
  });
  @override
  List<Object?> get props => [
        userModel,
        token,
        licencePate,
      ];
}

class OrderSummaryParams extends Equatable {
  final UserModel userModel;
  final String licencePate;
  final List<CartModel> cart;
  final String totalAmount;

  const OrderSummaryParams({
    required this.userModel,
    required this.cart,
    required this.licencePate,
    required this.totalAmount,
  });
  @override
  List<Object?> get props => [
        userModel,
        licencePate,
        cart,
        totalAmount,
      ];
}

class AccountSettingsParams extends Equatable {
  final bool isUserConnected;

  const AccountSettingsParams({
    required this.isUserConnected,
  });

  @override
  List<Object?> get props => [isUserConnected];
}

class RegisterPageParams extends Equatable {
  final bool showSkip;

  const RegisterPageParams({
    this.showSkip = true,
  });

  @override
  List<Object?> get props => [showSkip];
}
