import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/domain/repository/product_repository.dart';

class GetAllVehiclesUseCase implements UseCase<List<PriceVehicle>, NoParams> {
  final ProductRepository repository;

  GetAllVehiclesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PriceVehicle>>> call(NoParams noParams) async {
    return await repository.getAllVehicles();
  }
}
