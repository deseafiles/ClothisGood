import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/data/services/api/model/weather/weather_api_model.dart';
import 'package:android/utils/result.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({
    String? host,
    int? port,
    HttpClient Function()? clientFactory,
  })  : _host = host ?? 'api.open-meteo.com',
        _port = port ?? 443,
        _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();

    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  // Future<Result<Weather>> searchLocation(
  //   double lat,
  //   double long,
  // ) async {
  //     final client = _clientFactory();
  //
  //     try {
  //
  //           } catch (e) {
  //
  //           }
  //   }

  Future<Result<Weather>> getWeather(
    double lat,
    double long,
  ) async {
    final client = _clientFactory();

    try {
      final request = await client.getUrl(
        Uri(
          scheme: 'https',
          host: _host,
          port: _port,
          path: '/v1/forecast',
          queryParameters: {
            'latitude': '$lat',
            'longitude': '$long',
            'hourly': 'temperature_2m,precipitation_probability,'
                'relative_humidity_2m,rain,apparent_temperature',
          },
        ),
      );

      request.headers.add(
        HttpHeaders.acceptHeader,
        'application/json',
      );

      await _authHeader(request.headers);

      final response = await request.close();

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        final json = jsonDecode(body) as Map<String, dynamic>;

        final weather = new Weather(
          latitude: json['latitude'],
          longitude: json['longitude'],
          temperature2m: List<double>.from(json['hourly']['temperature_2m']),
          precipitationProbability: List<int>.from(json['hourly']['precipitation_probability']),
          relativeHumidity2m: List<int>.from(json['hourly']['relative_humidity_2m']),
          rain: List<double>.from(json['hourly']['rain']),
          apparentTemperature: List<double>.from(json['hourly']['apparent_temperature']),
        );

        // final List<Weather> weathers = [];
        //
        // for (int index = 0; index < totalData; index++) {
        //   final weather = new Weather(
        //     latitude: json['latitude'],
        //     longitude: json['longitude'],
        //     temperature2m: json['hourly']['temperature_2m'][index],
        //     precipitationProbability: json['hourly']['precipitation_probability'][index],
        //     relativeHumidity2m: json['hourly']['relative_humidity_2m'][index],
        //     rain: json['hourly']['rain'][index],
        //     apparentTemperature: json['hourly']['apparent_temperature'][index],
        //   );
        //
        //   weathers.add(weather);
        // }

        return Result.ok(weather);
      }

      return Result.error(
        HttpException(
          'Failed to load weather: ${response.statusCode}',
        ),
      );
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
