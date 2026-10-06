import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeolocatorService {
  Future<Position?> getCurrentPosition() async {
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

      Position position = await Geolocator.getCurrentPosition(locationSettings: const LocationSettings(accuracy:  LocationAccuracy.medium,
      distanceFilter: 50));

      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

      return position;
    }
  
  Future<String?> getCurrentLocation(Position position) async {
    final Geocoding geocoding = Geocoding(); 
    try {
      final placemarks = await geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

//       final placemarks = await geocoding.placemarkFromCoordinates(
// -3.906889,119.533581
//       );


      if (placemarks.isEmpty) {
        return null;
      }

      final place = placemarks.first;

      return place.locality ?? place.subAdministrativeArea ?? 'Unknown location';
    } catch (e) {
      print('Failed to fetch address: $e');
      return null;
    }
  }
}
