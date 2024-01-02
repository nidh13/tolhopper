import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/domain/repository/cart_repository.dart';

class DeleteProductFromCartUseCase
    implements UseCase<List<CartModel>, DeleteProductFromCartPrams> {
  final CartRepository repository;

  DeleteProductFromCartUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CartModel>>> call(
      DeleteProductFromCartPrams params) async {
    return await repository.deleteProductFromCart(id: params.id);
  }
}

class DeleteProductFromCartPrams extends Equatable {
  final String id;

  const DeleteProductFromCartPrams({required this.id});

  @override
  List<Object?> get props => [id];
}
