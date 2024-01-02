import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/app_location.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';
import 'package:tollhopper/global/google_map_bloc/domain/use_cases/google_pace_prediction_get_place_details_use_case.dart';
import 'package:tollhopper/global/google_map_bloc/domain/use_cases/google_palace_prediction_use_case.dart';
import 'package:tollhopper/global/utils/functions.dart';

part 'google_maps_event.dart';
part 'google_maps_state.dart';

class GoogleMapsBloc extends Bloc<GoogleMapsEvent, GoogleMapsState> {
  final GooglePlacesPredictionUseCase googlePlacesPredictionUseCase;
  final GooglePlacesPredictionDetailsUseCase
      googlePlacesPredictionDetailsUseCase;
  GoogleMapsBloc(
      {required this.googlePlacesPredictionUseCase,
      required this.googlePlacesPredictionDetailsUseCase})
      : super(GoogleMapsInitial());
  @override
  Stream<GoogleMapsState> mapEventToState(
    GoogleMapsEvent event,
  ) async* {
    if (event is GetLocationPredictionsEvent) {
      yield GoogleMapsFirstInputLoadingState();
      final listOrFailure = await googlePlacesPredictionUseCase(
          GooglePlacesPredictionPrams(
              text: event.text, languageCode: event.languageCode));
      yield listOrFailure.fold(
        (failure) =>
            GoogleMapsErrorState(message: mapFailureToMessage(failure)),
        (list) => ListPredictionsFirstInputState(listPredictions: list),
      );
    }
    if (event is GetLocationPredictionsSecondInputEvent) {
      yield GoogleMapsSecondInputLoadingState();
      final listOrFailure = await googlePlacesPredictionUseCase(
          GooglePlacesPredictionPrams(
              text: event.text, languageCode: event.languageCode));
      yield listOrFailure.fold(
        (failure) =>
            GoogleMapsErrorState(message: mapFailureToMessage(failure)),
        (list) => ListPredictionsSecondInputState(listPredictions: list),
      );
    } else if (event is GetLocationPredictionsDetailsEvent) {
      yield GoogleMapsSecondInputLoadingState();
      final locationOrFailure = await googlePlacesPredictionDetailsUseCase(
          GooglePlacesPredictionDetailsPrams(placeId: event.placeId));
      yield locationOrFailure.fold(
        (failure) =>
            GoogleMapsErrorState(message: mapFailureToMessage(failure)),
        (location) => ListPredictionsDetailsFirstInputState(location: location),
      );
    } else if (event is GetLocationPredictionsSecondDetailsInputEvent) {
      yield GoogleMapsSecondInputLoadingState();
      final locationOrFailure = await googlePlacesPredictionDetailsUseCase(
          GooglePlacesPredictionDetailsPrams(placeId: event.placeId));
      yield locationOrFailure.fold(
        (failure) =>
            GoogleMapsErrorState(message: mapFailureToMessage(failure)),
        (location) =>
            ListPredictionsDetailsSecondInputState(location: location),
      );
    }
  }
}
