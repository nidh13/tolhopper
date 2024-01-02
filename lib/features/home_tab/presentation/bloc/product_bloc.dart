import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/home_tab/data/models/country_map_model.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_all_routes_use_case.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_all_vignette_product_use_case.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_country_maps_use_case.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_vehicle_use_case.dart';
import 'package:tollhopper/features/home_tab/domain/use_case/get_vignette_and_tolls_from_routes.dart';
import 'package:tollhopper/global/utils/countries_names_utils.dart';
import 'package:tollhopper/global/utils/functions.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllVignetteProductUseCaseCase getAllVignetteProductUseCaseCase;
  final GetAllRoutesWithStringLocationsUseCaseCase
      getAllRoutesWithStringLocationsUseCaseCase;
  final GetVignetteAndTollsFromRoutesUseCase
      getVignetteAndTollsFromRoutesUseCase;
  final GetAllVehiclesUseCase getAllVehiclesUseCase;
  final GetCountryMapUseCase getCountryMapUseCase;

  ProductBloc({
    required this.getAllVignetteProductUseCaseCase,
    required this.getAllRoutesWithStringLocationsUseCaseCase,
    required this.getVignetteAndTollsFromRoutesUseCase,
    required this.getAllVehiclesUseCase,
    required this.getCountryMapUseCase,
  }) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProductsEvent) {
      yield ProductLoadingState();
      final listOrFailure = await getAllVignetteProductUseCaseCase(NoParams());
      yield listOrFailure.fold(
        (failure) => ProductError(
            message: mapFailureToMessage(failure),
            isIntentFailure: (failure.runtimeType == ConnexionFailure)),
        (list) => ListProductLoadedState(listProduct: list),
      );
    } else if (event is GetCountryMapEvent) {
      yield CountryMapLoadingState();

      final listOrFailure = await getCountryMapUseCase(NoParams());

      yield listOrFailure.fold(
        (failure) => CountryMapError(
          message: mapFailureToMessage(failure),
          isIntentFailure: (failure.runtimeType == ConnexionFailure),
        ),
        (success) {
          List<String> maps = [];
          getCountryMap(success, maps, 'austria');
          getCountryMap(success, maps, 'slovenien');
          getCountryMap(success, maps, 'slovenien');
          getCountryMap(success, maps, 'slovenien');
          getCountryMap(success, maps, 'slovenien');
          return CountryMapLoadedState(countriesMap: maps);
        },
      );
    } else if (event is GetAllVehiclesEvent) {
      yield VehicleLoadingState();
      final listOrFailure = await getAllVehiclesUseCase(NoParams());
      yield listOrFailure.fold(
        (failure) => VehicleError(
            message: mapFailureToMessage(failure),
            isIntentFailure: (failure.runtimeType == ConnexionFailure)),
        (list) => ListVignetteLoadedState(listVehicles: list),
      );
    } else if (event is GetRoutesEvent) {
      yield ProductGruLoadingState();
      final listOrFailure = await getAllRoutesWithStringLocationsUseCaseCase(
        GetAllRoutesWithStringLocationsPrams(
          startLocationId: event.startLocationId,
          destinationLocationId: event.destinationLocationId,
          destination: event.destination,
          start: event.start,
        ),
      );
      yield listOrFailure.fold(
        (failure) => ProductGruError(
            message: mapFailureToMessage(failure),
            undefinedCountryFailure:
                (failure.runtimeType == UndefinedCountryFailure),
            isIntentFailure: (failure.runtimeType == ConnexionFailure)),
        (list) => ListRoutesLoadedState(listRoutes: list),
      );
    } else if (event is GetVignetteAndTollsEvent) {
      yield ProductLoadingState();
      //check if this route has tolls
      final hasNotTolls = event.tollRoutesModel.tolls?.isEmpty == true;
      //check if this route has vignette
      final hasNotVignette = event.tollRoutesModel.vignettes?.isEmpty == true;

      if (hasNotTolls && hasNotVignette) {
        yield FreeToolsAndVignetteState(
            hasTolls: false, hasVignette: false, otherCountries: const []);
      }
      final hasAustriaTolls = event.tollRoutesModel.hasAustriaTolls();
      final hasAustriaVignette = event.tollRoutesModel.hasAustriaVignette();
      final hasSloveniaTolls = event.tollRoutesModel.hasSloveniaTolls();
      final hasSloveniaVignette = event.tollRoutesModel.hasSloveniaVignette();
      final hasSwitzerlandTolls = event.tollRoutesModel.hasSwitzerlandTolls();
      final hasSwitzerlandVignette =
          event.tollRoutesModel.hasSwitzerlandVignette();
      final hasHungaryTolls = event.tollRoutesModel.hasHungaryTolls();
      final hasHungaryVignette = event.tollRoutesModel.hasHungaryVignette();

      final hasRomaniaTolls = event.tollRoutesModel.hasRomaniaTolls();
      final hasRomaniaVignette = event.tollRoutesModel.hasRomaniaVignette();

      final hasCzechTolls = event.tollRoutesModel.hasCzechTolls();
      final hasCzechVignette = event.tollRoutesModel.hasCzechVignette();

      final austriaRoads = event.tollRoutesModel.getRoadsAustriaTolls();

      final getOtherCountryVignettes =
          event.tollRoutesModel.getOtherCountriesVignettes();

      final getOtherCountryTolls = event.tollRoutesModel
          .getOtherCountriesTolls(getOtherCountryVignettes);

      if (hasAustriaVignette ||
          hasSloveniaVignette ||
          hasAustriaTolls ||
          hasSwitzerlandVignette ||
          hasHungaryVignette ||
          hasRomaniaVignette ||
          hasRomaniaTolls ||
          hasCzechVignette) {
        final listOrFailure = await getVignetteAndTollsFromRoutesUseCase(
          GetVignetteAndTollsFromRoutesPrams(
            tollRoutesModel: event.tollRoutesModel,
            hasAustriaTolls: hasAustriaTolls,
            hasAustriaVignette: hasAustriaVignette,
            hasSloveniaTolls: hasSloveniaTolls,
            hasSloveniaVignette: hasSloveniaVignette,
            hasRomaniaVignette: hasRomaniaVignette,
            hasSwitzerlandTolls: hasSwitzerlandTolls,
            hasSwitzerlandVignette: hasSwitzerlandVignette,
            hasHungaryTolls: hasHungaryTolls,
            hasRomaniaTolls: hasRomaniaTolls,
            hasHungaryVignette: hasHungaryVignette,
            hasCzechTolls: hasCzechTolls,
            hasCzechVignette: hasCzechVignette,
            vehicleId: event.vehicleId,
            dateStart: event.dateStart,
            dateEnd: event.dateEnd,
            austriaRoads: austriaRoads,
          ),
        );
        yield listOrFailure.fold(
          (failure) => ProductError(
            message: mapFailureToMessage(failure),
            isIntentFailure: (failure.runtimeType == ConnexionFailure),
          ),
          (list) => ListVignetteAndTollsLoadedFromRouteState(
            austriaTollsList: list.listTollsAustria,
            austriaVignettesList: list.listVignetteAustria,
            sloveniaVignettesList: list.listVignetteSlovenia,
            switzerlandVignettesList: list.listVignetteSwitzerland,
            hungaryVignetteList: list.listVignetteHungary,
            romaniaVignetteList: list.listVignetteRomania,
            czechVignetteList: list.listVignetteCzech,
            hasTolls: !hasNotTolls,
            otherCountries: getOtherCountryTolls,
            hasVignette: !hasNotVignette,
            hasAustriaTolls: hasAustriaTolls,
            hasSloveniaTolls: hasSloveniaTolls,
            hasSwitzerlandTolls: hasSwitzerlandTolls,
            hasHungaryTolls: hasHungaryTolls,
            hasRomaniaTolls: hasRomaniaTolls,
            hasCzechTolls: hasCzechTolls,
            hasAustriaVignette: hasAustriaVignette,
            hasSloveniaVignette: hasSloveniaVignette,
            hasSwitzerlandVignette: hasSwitzerlandVignette,
            hasHungaryVignette: hasHungaryVignette,
            hasRomaniaVignette: hasRomaniaVignette,
            hasCzechVignette: hasCzechVignette,
          ),
        );
      } else {
        yield FreeToolsAndVignetteState(
          hasTolls: !hasNotTolls,
          hasVignette: !hasNotVignette,
          otherCountries: getOtherCountryTolls,
        );
      }
    }
  }

  List<String> getCountryMap(
      List<CountryMapModel> listMap, List<String> maps, String country) {
    maps.add(listMap
            .firstWhere((item) =>
                item.attributes?.name?.toLowerCase().contains(country) ?? false)
            .attributes
            ?.formats
            ?.medium
            ?.url ??
        '');

    return maps;
  }
}
