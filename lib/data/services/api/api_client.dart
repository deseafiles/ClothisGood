import 'dart:convert';
import 'dart:io';

// import 'package:android/domain/models/weathers/weather.dart';

class ApiService {
  // static const baseUrl = 'https://api.open-meteo.com/v1';
  static const baseUrl = 'https:';

  Future<dynamic> get(String path) async {
    final client = HttpClient();

    try {
      final request = await client.getUrl(Uri.parse('$baseUrl//$path'));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      
      if (response.statusCode == 200) {
        return jsonDecode(body);
        
      } else {
        throw HttpException('Failed to load posts: ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }

  // Future<Weather> getWeather(double lat, double long) async {
  //   final Map<String, dynamic> data = await _get(
  //     '/forecast?latitude=$lat&longitude=$long'
  //     '&daily=temperature_2m_max,temperature_2m_min'
  //     '&hourly=temperature_2m,uv_index,apparent_temperature,'
  //     'precipitation_probability,relative_humidity_2m,'
  //     'wind_speed_10m,weather_code',
  //   );
  //
  //   print(data);
  //   return Weather.fromJson(data);
  // }
}
