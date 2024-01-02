import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/cart_tab/presentation/cart_tab_ui.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';

class CartTabPage extends StatefulWidget {
  final String price;
  final List<CartModel> cart;

  const CartTabPage({
    Key? key,
    required this.price,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartTabPage> createState() => _CartTabPageState();
}

class _CartTabPageState extends State<CartTabPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return CartTabUi(
          price: widget.price,
          cart: widget.cart,
          isEmpty: (state is CartEmptyState),
          isLoading: (state is CartLoadingState),
          checkout: () => checkoutButton(context),
          delete: deleteItem,
        );
      },
    );
  }

  void checkoutButton(BuildContext context) {
    Navigator.pushNamed(
      context,
      licensePlatformInformation,
      arguments: widget.cart,
    );
  }

  Future<void> deleteItem(String id, BuildContext context) async {
    final result = await DialogUtils.deleteProductFromCartDialog(
      context: context,
    );
    if (result) {
      BlocProvider.of<CartBloc>(context).add(DeleteProductEvent(id: id));
    }
  }
}
