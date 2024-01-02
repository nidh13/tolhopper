import 'package:dartz/dartz.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/netWork/network_info.dart';
import 'package:tollhopper/features/home_tab/data/data_sources/product_remote_data_sources.dart';
import 'package:tollhopper/features/home_tab/data/models/country_map_model.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/domain/repository/product_repository.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_vignette_and_tolls_from_routes.dart';
import 'package:tollhopper/global/google_map_bloc/data/data_sources/google_maps_remote_data_sources.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/enums/product_type_enum.dart';
import 'package:tollhopper/global/utils/functions.dart';

class ProductRepositoryImpl implements ProductRepository {
  final NetworkInfo networkInfo;
  final ProductDataSource productDataSource;
  final GoogleMapsRemoteDataSource googleMapsRemoteDataSource;

  ProductRepositoryImpl({
    required this.networkInfo,
    required this.productDataSource,
    required this.googleMapsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<VignetteProduct>>>
      getAllVignetteProductModel() async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final list = await productDataSource.getAllVignetteProduct();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TollRoutesModel>>>
      getAllRoutesWithWithCountryString({
    required String destination,
    required String start,
    required String? startLocationId,
    required String? destinationLocationId,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      AppLocation? startAppLocation;
      AppLocation? destinationAppLocation;
      if (startLocationId != null) {
        startAppLocation = await googleMapsRemoteDataSource.getPaceDetails(
            id: startLocationId);
      }
      if (destinationLocationId != null) {
        destinationAppLocation = await googleMapsRemoteDataSource
            .getPaceDetails(id: destinationLocationId);
      }
      final getRouteMap = getRoutesMapFromParams(
          startText: start,
          destinationText: destination,
          destinationLocation: destinationAppLocation,
          startLocation: startAppLocation);

      final list = await productDataSource.getAllRoutesWithStringLocations(
          getRouteMap: getRouteMap);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    } on UndefinedCountryException {
      return Left(UndefinedCountryFailure());
    }
  }

  @override
  Future<Either<Failure, GetVignetteAndTollsFromRoutesReturns>>
      getVignetteAndTollsFromRoute({
    required TollRoutesModel tollRoutesModel,
    required bool hasSloveniaVignette,
    required bool hasAustriaTolls,
    required bool hasAustriaVignette,
    required bool hasSloveniaTolls,
    required bool hasSwitzerlandVignette,
    required bool hasSwitzerlandTolls,
    required bool hasHungaryVignette,
    required bool hasHungaryTolls,
    required bool hasRomaniaVignette,
    required bool hasRomaniaTolls,
    required bool hasCzechVignette,
    required bool hasCzechTolls,
    required String dateStart,
    required String dateEnd,
    required String vehicleId,
    required List<String> austriaRoads,
  }) async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      List<VignetteProduct> listVignetteAustria = [];
      List<VignetteProduct> listTollsAustria = [];
      List<VignetteProduct> listSloveniaVignette = [];
      List<VignetteProduct> listSwitzerlandVignette = [];
      List<VignetteProduct> listHungaryVignette = [];
      List<VignetteProduct> listRomaniaVignette = [];
      List<VignetteProduct> listCzechVignette = [];

      if (hasSloveniaVignette) {
        listSloveniaVignette =
            await productDataSource.getAllVignetteProductFilter(
          countryCode: sloveniaCode,
          productType: ProductTypeEnum.vignette.name,
          dateEnd: dateEnd,
          dateStart: dateStart,
          vehicleId: vehicleId,
        );
      }
      if (hasAustriaVignette) {
        listVignetteAustria =
            await productDataSource.getAllVignetteProductFilter(
          countryCode: austriaCode,
          productType: ProductTypeEnum.vignette.name,
          dateEnd: dateEnd,
          dateStart: dateStart,
          vehicleId: vehicleId,
        );
      }
      if (hasAustriaTolls) {
        listTollsAustria = await productDataSource.getAllVignetteProductFilter(
          countryCode: austriaCode,
          productType: ProductTypeEnum.toll.name,
          dateEnd: dateEnd,
          dateStart: dateStart,
          vehicleId: vehicleId,
        );
        for (var toll in listTollsAustria) {
          toll.getPricesByRoads(austriaRoads);
        }
      }
      if (hasSwitzerlandVignette) {
        listSwitzerlandVignette =
            await productDataSource.getAllVignetteProductFilter(
          countryCode: switzerlandCode,
          productType: ProductTypeEnum.vignette.name,
          dateEnd: dateEnd,
          dateStart: dateStart,
          vehicleId: vehicleId,
        );
      }
      if (hasHungaryVignette) {
        listHungaryVignette =
            await productDataSource.getAllVignetteProductFilter(
          countryCode: hungaryCode,
          productType: ProductTypeEnum.vignette.name,
          dateEnd: dateEnd,
          dateStart: dateStart,
          vehicleId: vehicleId,
        );
      }
      if (hasRomaniaVignette) {
        listRomaniaVignette =
            await productDataSource.getAllVignetteProductFilter(
          dateStart: dateStart,
          dateEnd: dateEnd,
          vehicleId: vehicleId,
          productType: ProductTypeEnum.vignette.name,
          countryCode: romaniaCode,
        );
      }

      if (hasCzechVignette) {
        listCzechVignette = await productDataSource.getAllVignetteProductFilter(
          dateStart: dateStart,
          dateEnd: dateEnd,
          vehicleId: vehicleId,
          productType: ProductTypeEnum.vignette.name,
          countryCode: czeChiaCode,
        );
      }

      return Right(
        GetVignetteAndTollsFromRoutesReturns(
          listTollsAustria: listTollsAustria,
          listVignetteAustria: listVignetteAustria,
          listVignetteSlovenia: listSloveniaVignette,
          listVignetteSwitzerland: listSwitzerlandVignette,
          listVignetteHungary: listHungaryVignette,
          listVignetteRomania: listRomaniaVignette,
          listVignetteCzech: listCzechVignette,
        ),
      );
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PriceVehicle>>> getAllVehicles() async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final list = await productDataSource.getAllVehicles();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CountryMapModel>>> getCountriesMap() async {
    if (await networkInfo.isConnected == false) {
      return Left(ConnexionFailure());
    }
    try {
      final listCountryMap = await productDataSource.getCountriesMap();
      return Right(listCountryMap);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
