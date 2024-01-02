import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/features/home_tab/data/models/country_map_model.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_vignette_and_tolls_from_routes.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<VignetteProduct>>> getAllVignetteProductModel();

  Future<Either<Failure, List<PriceVehicle>>> getAllVehicles();

  Future<Either<Failure, List<TollRoutesModel>>>
      getAllRoutesWithWithCountryString({
    required String destination,
    required String start,
    required String? startLocationId,
    required String? destinationLocationId,
  });

  Future<Either<Failure, GetVignetteAndTollsFromRoutesReturns>>
      getVignetteAndTollsFromRoute({
    required TollRoutesModel tollRoutesModel,
    required bool hasSloveniaVignette,
    required bool hasAustriaTolls,
    required bool hasAustriaVignette,
    required bool hasSloveniaTolls,
    required bool hasSwitzerlandVignette,
    required bool hasSwitzerlandTolls,
    required bool hasHungaryTolls,
    required bool hasHungaryVignette,
    required bool hasRomaniaVignette,
    required bool hasRomaniaTolls,
    required bool hasCzechTolls,
    required bool hasCzechVignette,
    required String dateStart,
    required String dateEnd,
    required String vehicleId,
    required List<String> austriaRoads,
  });

  Future<Either<Failure, List<CountryMapModel>>> getCountriesMap();
}
