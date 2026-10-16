import 'package:android/data/repositories/weathers/weather_repository.dart';
import 'package:android/data/repositories/weathers/weather_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:android/data/services/api/api_client.dart';
import 'package:android/domain/models/weathers/weather.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final apiClient = ApiService();

  return WeatherRepositoryImpl(apiClient);
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
