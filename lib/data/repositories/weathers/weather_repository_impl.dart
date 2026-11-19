import 'package:android/data/datasources/api/weather/weather_api_service.dart';
import 'package:android/data/repositories/weathers/weather_repository.dart';
import 'package:android/domain/models/weathers/weather.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    final response = await apiService.getWeather(lat, lon);
    return response;
  }
}
