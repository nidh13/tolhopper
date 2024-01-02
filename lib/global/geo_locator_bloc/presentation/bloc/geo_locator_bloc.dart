import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/core/use_cases/use_case.dart';
import 'package:tollhopper/global/geo_locator_bloc/data/models/location_geo_coordinates.dart';
import 'package:tollhopper/global/geo_locator_bloc/domain/usecases/get_current_position_use_case.dart';
import 'package:tollhopper/global/utils/country_app.dart';

part 'geo_locator_event.dart';
part 'geo_locator_state.dart';

class GeoLocatorBloc extends Bloc<GeoLocatorEvent, GeoLocatorState> {
  GeoLocatorBloc({
    required GetCurrentPositionUseCase getCurrentPositionUseCase,
  })  : _getCurrentPositionUseCase = getCurrentPositionUseCase,
        super(GeoLocatorInitial()) {
    on<GetCurrentLocation>(_getCurrentLocation);
  }

  final GetCurrentPositionUseCase _getCurrentPositionUseCase;

  Future<void> _getCurrentLocation(
      GetCurrentLocation event, Emitter<GeoLocatorState> emit) async {
    emit(LocationLoading());

    final result = await _getCurrentPositionUseCase.call(NoParams());

    result.fold(
      (failure) {
        emit(LocationFailed());
      },
      (position) {
        CountryCode nearestCountry = getNearestCountry(
          currentLocation: LocationGeoCoordinates(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        );
        emit(
          LocationLoaded(
            countryCode: nearestCountry,
          ),
        );
      },
    );
  }

  CountryCode getNearestCountry({
    required LocationGeoCoordinates currentLocation,
  }) {
    double minValue = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      appListCountriesPosition[0].latitude,
      appListCountriesPosition[0].longitude,
    );
    int minIndex = 0;

    for (int i = 1; i < appListCountriesPosition.length; i++) {
      var distance = Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        appListCountriesPosition[i].latitude,
        appListCountriesPosition[i].longitude,
      );
      if (distance < minValue) {
        minValue = distance;
        minIndex = i;
      }
    }
    return CountryCode.fromCountryCode(appListCountries[minIndex]);
  }
}
