part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {}

class GetAllVehiclesEvent extends ProductEvent {}

class GetRoutesEvent extends ProductEvent {
  final String destination;
  final String start;
  final String? startLocationId;
  final String? destinationLocationId;

  GetRoutesEvent({
    required this.destination,
    required this.start,
    required this.destinationLocationId,
    required this.startLocationId,
  });

  @override
  List<Object?> get props =>
      [destination, start, destinationLocationId, startLocationId];
}

class GetVignetteAndTollsEvent extends ProductEvent {
  final TollRoutesModel tollRoutesModel;
  final String dateEnd;
  final String dateStart;
  final String vehicleId;

  GetVignetteAndTollsEvent({
    required this.tollRoutesModel,
    required this.vehicleId,
    required this.dateStart,
    required this.dateEnd,
  });

  @override
  List<Object?> get props => [tollRoutesModel, dateEnd, dateStart, vehicleId];
}

class GetCountryMapEvent extends ProductEvent {}
