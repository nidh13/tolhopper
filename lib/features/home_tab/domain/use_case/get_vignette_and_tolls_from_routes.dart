import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tollhopper/core/error/failures.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/domain/repository/product_repository.dart';

class GetVignetteAndTollsFromRoutesUseCase
    implements
        UseCase<GetVignetteAndTollsFromRoutesReturns,
            GetVignetteAndTollsFromRoutesPrams> {
  final ProductRepository repository;

  GetVignetteAndTollsFromRoutesUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, GetVignetteAndTollsFromRoutesReturns>> call(
      GetVignetteAndTollsFromRoutesPrams params) async {
    return await repository.getVignetteAndTollsFromRoute(
      tollRoutesModel: params.tollRoutesModel,
      hasSloveniaVignette: params.hasSloveniaVignette,
      hasSloveniaTolls: params.hasSloveniaTolls,
      hasAustriaVignette: params.hasAustriaVignette,
      hasSwitzerlandVignette: params.hasSwitzerlandVignette,
      hasSwitzerlandTolls: params.hasSwitzerlandTolls,
      hasHungaryVignette: params.hasHungaryVignette,
      hasHungaryTolls: params.hasHungaryTolls,
      hasRomaniaVignette: params.hasRomaniaVignette,
      hasRomaniaTolls: params.hasRomaniaTolls,
      hasCzechVignette: params.hasCzechVignette,
      hasCzechTolls: params.hasCzechTolls,
      dateEnd: params.dateEnd,
      dateStart: params.dateStart,
      vehicleId: params.vehicleId,
      hasAustriaTolls: params.hasAustriaTolls,
      austriaRoads: params.austriaRoads,
    );
  }
}

class GetVignetteAndTollsFromRoutesPrams extends Equatable {
  final TollRoutesModel tollRoutesModel;
  final bool hasAustriaVignette;
  final bool hasSloveniaVignette;
  final bool hasSwitzerlandVignette;
  final bool hasHungaryVignette;
  final bool hasRomaniaVignette;
  final bool hasCzechVignette;
  final bool hasAustriaTolls;
  final bool hasSloveniaTolls;
  final bool hasSwitzerlandTolls;
  final bool hasHungaryTolls;
  final bool hasRomaniaTolls;
  final bool hasCzechTolls;
  final String dateEnd;
  final String dateStart;
  final String vehicleId;
  final List<String> austriaRoads;

  const GetVignetteAndTollsFromRoutesPrams({
    required this.tollRoutesModel,
    required this.hasSloveniaVignette,
    required this.hasAustriaTolls,
    required this.hasAustriaVignette,
    required this.hasHungaryVignette,
    required this.hasRomaniaVignette,
    required this.hasCzechVignette,
    required this.hasSloveniaTolls,
    required this.hasSwitzerlandVignette,
    required this.hasSwitzerlandTolls,
    required this.hasHungaryTolls,
    required this.hasRomaniaTolls,
    required this.hasCzechTolls,
    required this.vehicleId,
    required this.dateEnd,
    required this.austriaRoads,
    required this.dateStart,
  });

  @override
  List<Object?> get props => [
        tollRoutesModel,
        tollRoutesModel,
        hasAustriaTolls,
        hasAustriaVignette,
        hasSloveniaTolls,
        hasSloveniaVignette,
        hasRomaniaVignette,
        hasCzechVignette,
        hasSwitzerlandTolls,
        hasSwitzerlandVignette,
        hasHungaryVignette,
        hasHungaryTolls,
        hasRomaniaTolls,
        hasCzechTolls,
        vehicleId,
        dateEnd,
        dateStart,
        austriaRoads
      ];
}

class GetVignetteAndTollsFromRoutesReturns extends Equatable {
  final List<VignetteProduct> listTollsAustria;
  final List<VignetteProduct> listVignetteAustria;
  final List<VignetteProduct> listVignetteSlovenia;

  final List<VignetteProduct> listVignetteSwitzerland;
  final List<VignetteProduct> listVignetteHungary;
  final List<VignetteProduct> listVignetteRomania;
  final List<VignetteProduct> listVignetteCzech;

  const GetVignetteAndTollsFromRoutesReturns({
    required this.listVignetteAustria,
    required this.listVignetteSlovenia,
    required this.listTollsAustria,
    required this.listVignetteSwitzerland,
    required this.listVignetteHungary,
    required this.listVignetteRomania,
    required this.listVignetteCzech,
  });

  @override
  List<Object?> get props => [
        listVignetteAustria,
        listVignetteSlovenia,
        listTollsAustria,
        listVignetteSwitzerland,
        listVignetteHungary,
        listVignetteCzech,
      ];
}
