import 'package:android/data/datasources/api/weather/weather_api_service.dart';
import 'package:android/data/datasources/local/local_geolocator_service.dart';
import 'package:android/data/repositories/weathers/weather_repository_impl.dart';
import 'package:android/domain/models/weathers/current_weather.dart';
import 'package:android/domain/models/weathers/location_data.dart';
import 'package:android/domain/models/weathers/weather_location_selected.dart';
import 'package:android/services/weather_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geolocatorServiceProvider = Provider<GeolocatorService>((ref) {
  return GeolocatorService();
});

final weatherServiceProvider = Provider<WeatherService>((ref) {
  final geolocator = ref.watch(geolocatorServiceProvider);

  return WeatherService(
    WeatherRepositoryImpl(WeatherApiService()),
    geolocator,
  );
});

// Mengambil current weather berdasarkan lokasi perangkat
final getLangLongProvider = FutureProvider<CurrentWeather>((ref) async {
  final service = ref.watch(weatherServiceProvider);

  return service.getWeatherBasedOnLatLong();
});

// Mengambil nama lokasi berdasarkan latitude dan longitude perangkat
final getLocationProvider = FutureProvider<String?>((ref) async {
  final service = ref.watch(weatherServiceProvider);

  return service.getLocation();
});

// Mengambil deskripsi cuaca berdasarkan weather code
final getWeatherCodeProvider = FutureProvider.family<String, CurrentWeather>((ref, weather) async {
  final service = ref.watch(weatherServiceProvider);

  return service.getWeatherCode(weather);
});

//Mengambil location berdasarkan apa yang dilempar
final getLocationFromJsonProvider =
    FutureProvider.family<String?, LocationData>((ref, location) async {
  final service = ref.watch(weatherServiceProvider);

  return service.getLocationFromJson(location);
});

final locationsProvider = FutureProvider<List<LocationData>>((ref) async {
  final service = ref.watch(weatherServiceProvider);

  return service.loadLocations();
});

final getWeatherFromLocationProvider =
    FutureProvider.family<CurrentWeather, LocationData>(
  (ref, location) async {
    final service = ref.watch(weatherServiceProvider);

    return service.getWeatherFromLocation(location);
  },
);

final selectedWeatherLocationProvider =
    StateProvider<WeatherLocationSelected?>((ref) => null);
    

