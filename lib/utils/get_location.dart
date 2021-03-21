import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pre_project/data/LocationData.dart';

class GetLocation {
  static Future<LocationData> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    LocationData d = new LocationData();
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      d.error = true;
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        d.error = true;
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
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
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    d.position = await Geolocator.getCurrentPosition();
    d.address = "${first.featureName} : ${first.addressLine}";
    return d;
  }
}
