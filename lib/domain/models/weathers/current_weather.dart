import 'package:android/domain/models/weathers/daily.dart';
import 'package:android/domain/models/weathers/hourly.dart';

class CurrentWeather {
  final String time;
  final double temperature;
  final double apparentTemperature;
  final int weatherCode;
  final double uvIndex;
  final int temperatureMax;
  final int temperatureMin;
  final int precipitationProbability;
  final int relativeHumidity;
  final double windSpeed;

  CurrentWeather({
    required this.time,
    required this.temperature,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.uvIndex,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.precipitationProbability,
    required this.relativeHumidity,
    required this.windSpeed,
  });

  factory CurrentWeather.fromWeatherData({
    required Hourly hourlyData,
    required Daily dailyData,
    required int currentIndex,
  }) {
    return CurrentWeather(
      time: hourlyData.time[currentIndex],
      temperature: hourlyData.temperature2m[currentIndex],
      apparentTemperature: hourlyData.apparentTemperature[currentIndex],
      weatherCode: hourlyData.weatherCode[currentIndex],
      uvIndex: hourlyData.uvIndex[currentIndex],
      temperatureMax: dailyData.temperature2mMax[0].round(),
      temperatureMin: dailyData.temperature2mMin[0].round(),
      precipitationProbability:
          hourlyData.precipitationProbability[currentIndex],
      relativeHumidity: hourlyData.relativeHumidity2m[currentIndex],
      windSpeed: hourlyData.windSpeed10m[currentIndex],
    );
  }
}
