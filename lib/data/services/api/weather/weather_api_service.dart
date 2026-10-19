import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/data/services/api/api_client.dart';

class WeatherApiService {
  // static const baseUrl = 'api.open-meteo.com/v1';
  
  Future<Weather> getWeather(double lat, double long) async {
    final api = ApiService();

    final Map<String, dynamic> data = await api.get(
      'api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long'
      '&daily=temperature_2m_max,temperature_2m_min'
      '&hourly=temperature_2m,uv_index,apparent_temperature,'
      'precipitation_probability,relative_humidity_2m,'
      'wind_speed_10m,weather_code',
    );

    print(data);
    return Weather.fromJson(data);
  }
}
