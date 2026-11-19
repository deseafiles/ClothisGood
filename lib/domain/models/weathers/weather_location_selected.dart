import 'package:android/domain/models/weathers/location_data.dart';

class WeatherLocationSelected {
  final bool useCurrentLocation;
  final LocationData? location;

  const WeatherLocationSelected({
    required this.useCurrentLocation,
    this.location,
  });
}
