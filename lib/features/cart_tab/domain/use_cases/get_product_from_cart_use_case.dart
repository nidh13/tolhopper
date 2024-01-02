import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/domain/repository/cart_repository.dart';

class GetProductSFromUseCase implements UseCase<List<CartModel>, NoParams> {
  final CartRepository repository;

  GetProductSFromUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CartModel>>> call(NoParams noParams) async {
    return await repository.getProductsFromCart();
  }
}
