class AppLocation {
  double? latitude;
  double? longitude;

  AppLocation(this.latitude, this.longitude);

  AppLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['lat'];
    longitude = json['lng'];
  }
}
