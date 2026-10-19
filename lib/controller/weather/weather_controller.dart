import 'package:android/data/repositories/weathers/weather_repository.dart';
import 'package:android/data/repositories/weathers/weather_repository_impl.dart';
import 'package:android/data/services/api/weather/weather_api_service.dart';
import 'package:android/data/services/local/local_geolocator_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:android/data/services/api/api_client.dart';
import 'package:android/domain/models/weathers/weather.dart';
import 'package:geolocator/geolocator.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final weatherApi = WeatherApiService();

  return WeatherRepositoryImpl(weatherApi);
});

final weatherProvider = FutureProvider.family<
    Weather,
    ({double lat, double lon})>((ref, location) async {
  final repository = ref.watch(weatherRepositoryProvider);

  return repository.getWeather(
    location.lat,
    location.lon,
  );
});

final locationProvider = FutureProvider<Position>((ref) {
  return GeolocatorService().getCurrentPosition();
});

final decodeLocationProvider = FutureProvider.family<
    String?,
    ({double lat, double lon})
>((ref, location) {
  return GeolocatorService.fromLatLongIntoLocation(
    location.lat,
    location.lon,
  );
});
