import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/home_tab/data/models/country_map_model.dart';
import 'package:tollhopper/features/home_tab/domain/repository/product_repository.dart';

class GetCountryMapUseCase extends UseCase<List<CountryMapModel>, NoParams> {
  final ProductRepository repository;

  GetCountryMapUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<CountryMapModel>>> call(NoParams params) async {
    return await repository.getCountriesMap();
  }
}
