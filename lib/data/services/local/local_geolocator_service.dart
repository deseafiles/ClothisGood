import 'dart:async';

import 'package:android/domain/models/weathers/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeolocatorService {
  Future<Position> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Layanan lokasi tidak aktif.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Izin lokasi ditolak permanen. Aktifkan lewat pengaturan aplikasi.',
      );
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
        timeLimit: Duration(seconds: 15),
      ),
    );

    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    return position;
  }

  Stream<Position> positionStream() => Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          distanceFilter: 100,
        ),
      );
  
  static Future<String?> fromLatLongIntoLocation(double lat, double long) async {
    final Geocoding geocoding = Geocoding(); 
    try {
      final placemarks = await geocoding.placemarkFromCoordinates(
        lat,
        long,
      );

//       final placemarks = await geocoding.placemarkFromCoordinates(
// -3.906889,119.533581
//       );

      if (placemarks.isEmpty) {
        return null;
      }

      final place = placemarks.first;
      // nama kelurahan
      final location = place.subLocality
      ?? place.locality ?? place.subAdministrativeArea ?? 'Unknown location';

      return location;
    } catch (e) {
      print('Failed to fetch address: $e');
      return null;
    }
  }
}
