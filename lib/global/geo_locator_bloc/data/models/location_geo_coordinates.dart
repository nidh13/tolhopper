import 'package:equatable/equatable.dart';

class LocationGeoCoordinates extends Equatable {
  final double longitude;
  final double latitude;

  const LocationGeoCoordinates({
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [longitude, latitude];
}
