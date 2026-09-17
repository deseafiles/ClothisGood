import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  

  Future<Position?> getCurrentLocation() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
          return Future.error('Location services are disable.');
        }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();

          if (permission == LocationPermission.denied) {
              return Future.error('Location permissions are denied');
            }
        }

      if (permission == LocationPermission.deniedForever) {
          return Future.error('Location permissions are permanently denied, cannot request.');
        }

      Position position = await Geolocator.getCurrentPosition(locationSettings: const LocationSettings(accuracy:  LocationAccuracy.high));

      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

      return position;
    }
}
