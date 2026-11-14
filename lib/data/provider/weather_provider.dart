import 'package:android/controllers/weather_controller.dart';
import 'package:android/data/repositories/weathers/weather_repository.dart';
import 'package:android/data/repositories/weathers/weather_repository_impl.dart';
import 'package:android/data/services/api/weather/weather_api_service.dart';
import 'package:android/data/services/local/local_geolocator_service.dart';
import 'package:android/domain/models/weathers/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//menyediakan objek repository, dipisah dengan weathercontrollerprovider bisa provider ini bisa dipake di bagian lain

// provider weather
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(WeatherApiService());
});

// provider geolocator service
final geolocatorServiceProvider = Provider<GeolocatorService>((ref) {
    return GeolocatorService();
  });

// mekanisme mengambil repository, terus dilempar ke weatherconroller, controller pake repository untuk ambil data API
final weatherControllerProvider = Provider<WeatherController>((ref) {
  final repository = ref.watch(weatherRepositoryProvider);
  final geolocator = ref.watch(geolocatorServiceProvider);

  return WeatherController(repository, geolocator);
});

final getWeatherProvider = FutureProvider<Weather>((ref) async {
  final controller = ref.watch(weatherControllerProvider);

  return controller.getWeatherBasedOnLatLong();
});

final getLocationProvider = FutureProvider<String?>((ref) {
    final controller = ref.watch(weatherControllerProvider);

    return controller.getLocation();
  });

final getWeatherCodeProvider = FutureProvider.family<String, Weather>(
  (ref, weather) async {
    final controller = ref.watch(weatherControllerProvider);

    return controller.getWeatherCode(weather);
  },
);

