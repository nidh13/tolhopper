part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class VehicleLoadingState extends ProductState {}

class ProductGruLoadingState extends ProductState {}

class CountryMapLoadingState extends ProductState {}

class ProductError extends ProductState {
  final String message;
  final bool isIntentFailure;

  ProductError({
    required this.message,
    required this.isIntentFailure,
  });

  @override
  List<Object?> get props => [message, isIntentFailure];
}

class VehicleError extends ProductState {
  final String message;
  final bool isIntentFailure;

  VehicleError({
    required this.message,
    required this.isIntentFailure,
  });

  @override
  List<Object?> get props => [message, isIntentFailure];
}

class ProductGruError extends ProductState {
  final String message;
  final bool isIntentFailure;
  final bool undefinedCountryFailure;

  ProductGruError({
    required this.message,
    required this.isIntentFailure,
    required this.undefinedCountryFailure,
  });

  @override
  List<Object?> get props =>
      [message, isIntentFailure, undefinedCountryFailure];
}

class CountryMapError extends ProductState {
  final String message;
  final bool isIntentFailure;

  CountryMapError({
    required this.message,
    required this.isIntentFailure,
  });

  @override
  List<Object?> get props => [message, isIntentFailure];
}

class ListProductLoadedState extends ProductState {
  final List<VignetteProduct> listProduct;

  ListProductLoadedState({required this.listProduct});

  @override
  List<Object?> get props => [listProduct];
}

class ListVignetteLoadedState extends ProductState {
  final List<PriceVehicle> listVehicles;

  ListVignetteLoadedState({required this.listVehicles});

  @override
  List<Object?> get props => [listVehicles];
}

class ListRoutesLoadedState extends ProductState {
  final List<TollRoutesModel> listRoutes;

  ListRoutesLoadedState({required this.listRoutes});

  @override
  List<Object?> get props => [listRoutes];
}

class ListVignetteAndTollsLoadedFromRouteState extends ProductState {
  final List<VignetteProduct> sloveniaVignettesList;
  final List<VignetteProduct> austriaTollsList;
  final List<VignetteProduct> austriaVignettesList;
  final List<VignetteProduct> switzerlandVignettesList;
  final List<VignetteProduct> hungaryVignetteList;
  final List<VignetteProduct> romaniaVignetteList;
  final List<VignetteProduct> czechVignetteList;
  final bool hasTolls;
  final bool hasVignette;
  final bool hasSloveniaTolls;
  final bool hasAustriaTolls;
  final bool hasSwitzerlandTolls;
  final bool hasHungaryTolls;
  final bool hasRomaniaTolls;
  final bool hasCzechTolls;
  final bool hasSloveniaVignette;
  final bool hasAustriaVignette;
  final bool hasSwitzerlandVignette;
  final bool hasHungaryVignette;
  final bool hasRomaniaVignette;
  final bool hasCzechVignette;
  final List<DefinedCountry> otherCountries;

  ListVignetteAndTollsLoadedFromRouteState({
    required this.sloveniaVignettesList,
    required this.austriaTollsList,
    required this.austriaVignettesList,
    required this.switzerlandVignettesList,
    required this.hungaryVignetteList,
    required this.romaniaVignetteList,
    required this.czechVignetteList,
    required this.hasTolls,
    required this.hasVignette,
    required this.otherCountries,
    required this.hasSloveniaTolls,
    required this.hasAustriaTolls,
    required this.hasSwitzerlandTolls,
    required this.hasHungaryTolls,
    required this.hasRomaniaTolls,
    required this.hasCzechTolls,
    required this.hasSloveniaVignette,
    required this.hasAustriaVignette,
    required this.hasSwitzerlandVignette,
    required this.hasHungaryVignette,
    required this.hasRomaniaVignette,
    required this.hasCzechVignette,
  });

  @override
  List<Object?> get props => [
        sloveniaVignettesList,
        austriaTollsList,
        austriaVignettesList,
        switzerlandVignettesList,
        hungaryVignetteList,
        romaniaVignetteList,
        czechVignetteList,
        hasTolls,
        hasVignette,
        otherCountries,
        hasSloveniaTolls,
        hasAustriaTolls,
        hasSwitzerlandTolls,
        hasHungaryTolls,
        hasRomaniaTolls,
        hasCzechTolls,
        hasSloveniaVignette,
        hasAustriaVignette,
        hasSwitzerlandVignette,
        hasHungaryVignette,
        hasRomaniaVignette,
        hasCzechVignette,
      ];
}

class FreeToolsAndVignetteState extends ProductState {
  final bool hasTolls;
  final bool hasVignette;
  final List<DefinedCountry> otherCountries;

  FreeToolsAndVignetteState({
    required this.hasTolls,
    required this.hasVignette,
    required this.otherCountries,
  });

  @override
  List<Object?> get props => [
        hasTolls,
        hasVignette,
        otherCountries,
      ];
}

class CountryMapLoadedState extends ProductState {
  final List<String> countriesMap;

  CountryMapLoadedState({
    required this.countriesMap,
  });

  @override
  List<Object?> get props => [countriesMap];
}
