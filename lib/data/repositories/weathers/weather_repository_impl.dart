// import 'package:android/data/services/api/api_client.dart';
import 'package:android/data/services/api/weather/weather_api_service.dart';
import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/data/repositories/weathers/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  // final ApiService apiClient;
  final WeatherApiService weatherApiService;

  WeatherRepositoryImpl(this.weatherApiService);

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    return await weatherApiService.getWeather(lat, lon);
  }
}
