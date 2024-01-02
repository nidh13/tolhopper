import 'package:flutter/material.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/features/order_summary/presentation/order_summary_ui.dart';

class OrderSummaryPage extends StatefulWidget {
  final List<CartModel> cart;
  final UserModel userModel;
  final String pateLicence;
  final String totalAmount;
  const OrderSummaryPage(
      {Key? key,
      required this.userModel,
      required this.cart,
      required this.pateLicence,
      required this.totalAmount})
      : super(key: key);

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return OrderSummaryUi(
      totalCost: widget.totalAmount,
      pateNumber: widget.pateLicence,
      fullAddress: widget.userModel.getFullAdress(),
      fullName: widget.userModel.getFullName(),
      backToHome: () => backToHome(context),
      cart: widget.cart,
    );
  }

  void backToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, homePage, (Route<dynamic> route) => false);
  }
}
