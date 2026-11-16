import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:android/config/assets.dart';
import 'package:android/data/repositories/weathers/weather_repository.dart';
import 'package:android/data/services/local/local_geolocator_service.dart';
import 'package:android/domain/models/weathers/weather.dart';

class WeatherController {
  final WeatherRepository repository;
  final GeolocatorService geolocatorService;

  WeatherController(this.repository, this.geolocatorService);
//tidak memerlukan consumerwidget karena controller hanya melakukan pembacaan data saja dari provider yang telah didaftarkan
//gunakan extends consumerwidget jika hanya melakukan perubahan pada ui
  Future<Weather> getWeatherBasedOnLatLong() async {
    final position =  await geolocatorService.getCurrentPosition();

    final weather = await repository.getWeather(
        position.latitude,
        position.longitude,
      );
    return weather;
  }

  Future<String?> getLocation() async {
    final position = await geolocatorService.getCurrentPosition();

    final changeLocation = await geolocatorService.fromLatLongIntoLocation(position.latitude, position.longitude);
    
    return changeLocation;
    }

  Future<String> getWeatherCode(Weather weather) async {
    final jsonFile = await rootBundle.loadString(Assets.weathers);
    final weatherJson = jsonDecode(jsonFile) as Map<String, dynamic>;

    final code = weather.hourly.weatherCode[0];

    return weatherJson[code.toString()] ?? 'Unknown weather';
  }
}
