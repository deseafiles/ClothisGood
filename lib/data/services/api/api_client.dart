import 'dart:convert';
import 'dart:io';

import 'package:android/domain/models/weathers/weather.dart';

class ApiService {
  static const baseUrl = 'https://api.open-meteo.com/v1';

  Future<dynamic> _get(String path) async {
    final client = HttpClient();

    try {
      final request = await client.getUrl(Uri.parse('$baseUrl/$path'));
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

  Future<dynamic> getWeather() async {
    // final List data = await _get('posts');
    final List data = await _get('/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min&hourly=temperature_2m,uv_index,apparent_temperature,precipitation_probability,relative_humidity_2m,wind_speed_10m,weather_code');

    return data.map((item) => Weather.fromJson(item)).toList();
    // return data.map((item) => Post.fromJson(item)).toList();
  }
}

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:android/domain/models/weathers/weather.dart';
// import 'package:android/data/services/api/model/weather/weather_api_model.dart';
// import 'package:android/utils/result.dart';
//
// typedef AuthHeaderProvider = String? Function();
//
// class ApiClient {
//   ApiClient({
//     String? host,
//     int? port,
//     HttpClient Function()? clientFactory,
//   })  : _host = host ?? 'api.open-meteo.com',
//         _port = port ?? 443,
//         _clientFactory = clientFactory ?? HttpClient.new;
//
//   final String _host;
//   final int _port;
//   final HttpClient Function() _clientFactory;
//
//   AuthHeaderProvider? _authHeaderProvider;
//
//   set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
//     _authHeaderProvider = authHeaderProvider;
//   }
//
//   Future<void> _authHeader(HttpHeaders headers) async {
//     final header = _authHeaderProvider?.call();
//
//     if (header != null) {
//       headers.add(HttpHeaders.authorizationHeader, header);
//     }
//   }
//
//   // Future<Result<Weather>> searchLocation(
//   //   double lat,
//   //   double long,
//   // ) async {
//   //     final client = _clientFactory();
//   //
//   //     try {
//   //
//   //           } catch (e) {
//   //
//   //           }
//   //   }
//
//   Future<Result<Weather>> getWeather(
//     double lat,
//     double long,
//   ) async {
//     final client = _clientFactory();
//
//     try {
//       final request = await client.getUrl(
//         Uri(
//           scheme: 'https',
//           host: _host,
//           port: _port,
//           path: '/v1/forecast',
//           queryParameters: {
//             'latitude': '$lat',
//             'longitude': '$long',
//             'hourly': 'temperature_2m,precipitation_probability,'
//                 'relative_humidity_2m,rain,apparent_temperature',
//           },
//         ),
//       );
//
//       request.headers.add(
//         HttpHeaders.acceptHeader,
//         'application/json',
//       );
//
//       await _authHeader(request.headers);
//
//       final response = await request.close();
//
//       if (response.statusCode == 200) {
//
//         // final body = await response.transform(utf8.decoder).join();
//
//         // final json = jsonDecode(body) as Map<String, dynamic>;
//         //
//         // final weather = new Weather(
//         //   latitude: json['latitude'],
//         //   longitude: json['longitude'],
//         //   temperature2m: List<double>.from(json['hourly']['temperature_2m']),
//         //   precipitationProbability: List<int>.from(json['hourly']['precipitation_probability']),
//         //   relativeHumidity2m: List<int>.from(json['hourly']['relative_humidity_2m']),
//         //   rain: List<double>.from(json['hourly']['rain']),
//         //   apparentTemperature: List<double>.from(json['hourly']['apparent_temperature']),
//         // );
//
//         // final List<Weather> weathers = [];
//         //
//         // for (int index = 0; index < totalData; index++) {
//         //   final weather = new Weather(
//         //     latitude: json['latitude'],
//         //     longitude: json['longitude'],
//         //     temperature2m: json['hourly']['temperature_2m'][index],
//         //     precipitationProbability: json['hourly']['precipitation_probability'][index],
//         //     relativeHumidity2m: json['hourly']['relative_humidity_2m'][index],
//         //     rain: json['hourly']['rain'][index],
//         //     apparentTemperature: json['hourly']['apparent_temperature'][index],
//         //   );
//         //
//         //   weathers.add(weather);
//         // }
//
//         return Result.ok(weather);
//       }
//
//       return Result.error(
//         HttpException(
//           'Failed to load weather: ${response.statusCode}',
//         ),
//       );
//     } on Exception catch (error) {
//       return Result.error(error);
//     } finally {
//       client.close();
//     }
//   }
// }
