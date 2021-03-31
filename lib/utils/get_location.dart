import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pre_project/data/LocationData.dart';

class GetLocation {
  static Future<LocationData> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    LocationData d = new LocationData();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      d.error = true;
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        d.error = true;
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        d.error = true;
        return Future.error('Location permissions are denied');
      }
    }
    final v = await Geolocator.getCurrentPosition();
    final coordinates = new Coordinates(v.latitude, v.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    d.position = await Geolocator.getCurrentPosition();
    d.address = "${first.featureName} : ${first.addressLine}";
    return d;
  }

  static Future<Position> getposition() async {
    bool serviceEnabled;
    LocationPermission permission;
    LocationData d = new LocationData();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      d.error = true;
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        d.error = true;
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        d.error = true;
        return Future.error('Location permissions are denied');
      }
    }
    final v = await Geolocator.getCurrentPosition();
    return v;
  }
}
