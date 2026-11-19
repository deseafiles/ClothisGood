import 'dart:convert';
import 'package:android/data/datasources/local/local_geolocator_service.dart';
import 'package:android/domain/models/weathers/current_weather.dart';
import 'package:android/domain/models/weathers/location_data.dart';
import 'package:android/services/time.dart';
import 'package:flutter/services.dart';
import 'package:android/config/assets.dart';
import 'package:android/data/repositories/weathers/weather_repository.dart';
import 'package:android/domain/models/weathers/weather.dart';


class WeatherService {
  final WeatherRepository repository;
  final GeolocatorService geolocatorService;

  WeatherService(this.repository, this.geolocatorService);

  // Cuaca berdasarkan lokasi GPS perangkat
  Future<CurrentWeather> getWeatherBasedOnLatLong() async {
    final position = await geolocatorService.getCurrentPosition();

    return getWeatherFromCoordinates(
      position.latitude,
      position.longitude,
    );
  }

  // Cuaca berdasarkan lokasi yang dipilih pengguna
  Future<CurrentWeather> getWeatherFromLocation(
    LocationData location,
  ) async {
    return getWeatherFromCoordinates(
      location.latitude,
      location.longitude,
    );
  }

  // Pengolahan data cuaca digunakan bersama
  Future<CurrentWeather> getWeatherFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    final weather = await repository.getWeather(
      latitude,
      longitude,
    );

    final hourlyData = weather.hourly;
    final dailyData = weather.daily;

    final currentTime = TimeHelper.getCurrentDateTime();

    final currentIndex = hourlyData.time.indexWhere((timestamp) {
      final dateTime = TimeHelper.getDateTime(timestamp);

      return dateTime.year == currentTime.year &&
          dateTime.month == currentTime.month &&
          dateTime.day == currentTime.day &&
          dateTime.hour == currentTime.hour;
    });

    if (currentIndex == -1) {
      throw Exception('Current weather data not found');
    }

    return CurrentWeather.fromWeatherData(
      hourlyData: hourlyData,
      dailyData: dailyData,
      currentIndex: currentIndex,
    );
  }

  Future<String?> getLocation() async {
    final position = await geolocatorService.getCurrentPosition();

    return geolocatorService.fromLatLongIntoLocation(
      position.latitude,
      position.longitude,
    );
  }

  Future<String> getWeatherCode(CurrentWeather weather) async {
    final jsonFile = await rootBundle.loadString(Assets.weathers);
    final weatherJson = jsonDecode(jsonFile) as Map<String, dynamic>;

    final code = weather.weatherCode;

    return weatherJson[code.toString()] ?? 'Unknown weather';
  }

  Future<List<LocationData>> loadLocations() async {
    final response = await rootBundle.loadString('assets/locations.json');
    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => LocationData.fromJson(item)).toList();
  }

  Future<String?> getLocationFromJson(LocationData location) async {
    return geolocatorService.fromLatLongIntoLocation(
      location.latitude,
      location.longitude,
    );
  }
}
