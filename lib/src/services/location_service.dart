import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocationService {
  Future<bool> isLocationServiceEnabled() async =>
      await Geolocator.isLocationServiceEnabled();

  Future<bool> isLocationPermissionEnabled() async {
    var _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied)
      return false;
    else if (_permission == LocationPermission.deniedForever)
      return false;
    else
      return true;
  }

  Future<void> getLocationPermission() async =>
      await Geolocator.requestPermission();

  Future<Position> getCurrentLocation() async =>
      await Geolocator.getCurrentPosition();
}
