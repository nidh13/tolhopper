import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/domain/repository/product_repository.dart';

class GetAllVignetteProductUseCaseCase implements UseCase<List<VignetteProduct>, NoParams> {
  final ProductRepository repository;

  GetAllVignetteProductUseCaseCase({required this.repository});

  @override
  Future<Either<Failure, List<VignetteProduct>>> call(NoParams noParams) async {
    return await repository.getAllVignetteProductModel();
  }
}