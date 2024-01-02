part of 'geo_locator_bloc.dart';

@immutable
abstract class GeoLocatorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeoLocatorInitial extends GeoLocatorState {}

class LocationLoading extends GeoLocatorState {}

class LocationLoaded extends GeoLocatorState {
  final CountryCode countryCode;

  LocationLoaded({
    required this.countryCode,
  });

  @override
  List<Object?> get props => [countryCode];
}

class LocationFailed extends GeoLocatorState {}
