import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/cart_tab/domain/repository/cart_repository.dart';

class GetTotalCartPriceUseCase implements UseCase<String, NoParams> {
  final CartRepository repository;

  GetTotalCartPriceUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams noParams) async {
    return await repository.getPriceFromCart();
  }
}
