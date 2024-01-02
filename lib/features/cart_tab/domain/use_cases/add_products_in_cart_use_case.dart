import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/domain/repository/cart_repository.dart';

class AddProductToCartUseCase
    implements UseCase<List<CartModel>, AddProductToCartParams> {
  final CartRepository repository;

  AddProductToCartUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CartModel>>> call(
      AddProductToCartParams params) async {
    return await repository.addProductsToCart(items: params.items);
  }
}

class AddProductToCartParams extends Equatable {
  final List<CartModel> items;

  const AddProductToCartParams({required this.items});

  @override
  List<Object?> get props => [items];
}
