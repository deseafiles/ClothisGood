import 'package:android/weather/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class ApiClient {
  ApiClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host = host ?? 'localhost',
      _port = port ?? 8080,
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

  Future<Result<List<Weather>>> getWeather(double lat, double long) async {
    final client = _clientFactory();
    // Isi disini
    // WeatherModel nya itu didefine di services/api/model/weather/weather_model.dart. Saranku diganti namanya jadi Weather aja jgn WeatherModel.
  }
}

// Ini pindah ke getWeather nnti logicnya
class WeatherService {
  Future<WeatherModel?> fetchWeather(double lat, double long) async {
    final response = await http.get(
      Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&hourly=temperature_2m,precipitation_probability,relative_humidity_2m,rain,apparent_temperature',
      ),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
