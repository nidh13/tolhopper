import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartModel>>> addProductsToCart(
      {required List<CartModel> items});
  Future<Either<Failure, String>> getPriceFromCart();

  Future<Either<Failure, List<CartModel>>> getProductsFromCart();

  Future<Either<Failure, List<CartModel>>> deleteProductFromCart(
      {required String id});
}
