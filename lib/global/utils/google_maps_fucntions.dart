import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng calculateCameraPosition(List<Polyline> polylines) {
  double minLat = double.infinity;
  double maxLat = -double.infinity;
  double minLng = double.infinity;
  double maxLng = -double.infinity;

  for (Polyline polyline in polylines) {
    for (LatLng point in polyline.points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }
  }

  double centerLat = (maxLat + minLat) / 2;
  double centerLng = (maxLng + minLng) / 2;

  return LatLng(centerLat, centerLng);
}
