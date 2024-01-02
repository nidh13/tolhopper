part of 'google_maps_bloc.dart';

@immutable
abstract class GoogleMapsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLocationPredictionsEvent extends GoogleMapsEvent {
  final String text;
  final String languageCode;

  GetLocationPredictionsEvent({required this.text, required this.languageCode});

  @override
  List<Object?> get props => [text, languageCode];
}

class GetLocationPredictionsSecondInputEvent extends GoogleMapsEvent {
  final String text;
  final String languageCode;

  GetLocationPredictionsSecondInputEvent(
      {required this.text, required this.languageCode});

  @override
  List<Object?> get props => [text, languageCode];
}

class GetLocationPredictionsSecondDetailsInputEvent extends GoogleMapsEvent {
  final String placeId;

  GetLocationPredictionsSecondDetailsInputEvent({
    required this.placeId,
  });

  @override
  List<Object?> get props => [placeId];
}

class GetLocationPredictionsDetailsEvent extends GoogleMapsEvent {
  final String placeId;

  GetLocationPredictionsDetailsEvent({
    required this.placeId,
  });

  @override
  List<Object?> get props => [placeId];
}
