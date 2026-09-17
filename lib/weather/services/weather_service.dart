import 'package:android/weather/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class WeatherService {
    Future<WeatherModel?> fetchWeather(double lat, double long) async {
      final response = await http.get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&hourly=temperature_2m,precipitation_probability,relative_humidity_2m,rain,apparent_temperature'),
    headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
          throw Exception('Failed to load weather');
        }
    }
  }


