import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/cart_tab/data/data_sources/cart_local_data_sources.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataDataSource cartLocalDataDataSource;

  CartRepositoryImpl({required this.cartLocalDataDataSource});
  @override
  Future<Either<Failure, List<CartModel>>> addProductsToCart(
      {required List<CartModel> items}) async {
    try {
      List<CartModel> output = items;
      final cart = await cartLocalDataDataSource.getCart();
      if (cart != null) {
        final List<dynamic> cartJson = json.decode(cart);
        final listFromCash =
            cartJson.map((json) => CartModel.fromJson(json)).toList();
        output.addAll(listFromCash);
      }
      await cartLocalDataDataSource.saveCart(json.encode(output));
      return Right(output);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> deleteProductFromCart(
      {required String id}) async {
    try {
      final cart = await cartLocalDataDataSource.getCart();
      if (cart != null) {
        final List<dynamic> cartJson = json.decode(cart);
        var listFromCash =
            cartJson.map((json) => CartModel.fromJson(json)).toList();
        listFromCash.removeWhere((element) => element.id == id);
        await cartLocalDataDataSource.saveCart(json.encode(listFromCash));
        return Right(listFromCash);
      }
      return Left(CacheFailure());
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getPriceFromCart() {
    // TODO: implement getPriceFromCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartModel>>> getProductsFromCart() async {
    try {
      final cart = await cartLocalDataDataSource.getCart();
      if (cart != null) {
        final List<dynamic> cartJson = json.decode(cart);
        return Right(cartJson.map((json) => CartModel.fromJson(json)).toList());
      }
      return const Right([]);
    } on Exception {
      return Left(CacheFailure());
    }
  }
}
