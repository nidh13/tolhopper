import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/core/error/failures.dart';

abstract class GeoLocatorDataSource {
  Future<Position?> getCurrentLocation();
  Future<bool> checkLocationPermission();
}

class GeoLocatorDataSourceImpl extends GeoLocatorDataSource {
  final SharedPreferences prefs;

  GeoLocatorDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    // const String _isFirstTimeKey = 'FIRST_TIME_ASK_PERMISSION';
    // bool isFirstTime = prefs.getBool(_isFirstTimeKey) ?? true;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw (LocationException());
    }
    // // if (isFirstTime) {
    // if (!serviceEnabled) {
    //   await Geolocator.openLocationSettings();
    //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   // }
    //   // prefs.setBool(_isFirstTimeKey, false);
    // }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> checkLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      throw (LocationDeniedForeverException());
    } else if (permission == LocationPermission.denied) {
      final request = await Geolocator.requestPermission();
      if (request == LocationPermission.always ||
          request == LocationPermission.whileInUse) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
