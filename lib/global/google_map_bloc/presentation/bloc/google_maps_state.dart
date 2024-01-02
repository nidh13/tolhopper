part of 'google_maps_bloc.dart';

@immutable
abstract class GoogleMapsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoogleMapsInitial extends GoogleMapsState {}

class GoogleMapsFirstInputLoadingState extends GoogleMapsState {}

class GoogleMapsSecondInputLoadingState extends GoogleMapsState {}

class GoogleMapsErrorState extends GoogleMapsState {
  final String message;

  GoogleMapsErrorState({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class ListPredictionsFirstInputState extends GoogleMapsState {
  final List<PredictionModel> listPredictions;

  ListPredictionsFirstInputState({required this.listPredictions});

  @override
  List<Object?> get props => [listPredictions];
}

class ListPredictionsSecondInputState extends GoogleMapsState {
  final List<PredictionModel> listPredictions;

  ListPredictionsSecondInputState({required this.listPredictions});

  @override
  List<Object?> get props => [listPredictions];
}

class ListPredictionsDetailsFirstInputState extends GoogleMapsState {
  final AppLocation location;

  ListPredictionsDetailsFirstInputState({required this.location});

  @override
  List<Object?> get props => [location];
}

class ListPredictionsDetailsSecondInputState extends GoogleMapsState {
  final AppLocation location;

  ListPredictionsDetailsSecondInputState({required this.location});

  @override
  List<Object?> get props => [location];
}
