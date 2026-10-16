import 'package:android/domain/models/weathers/daily.dart';
import 'package:android/domain/models/weathers/daily_units.dart';
import 'package:android/domain/models/weathers/hourly.dart';
import 'package:android/domain/models/weathers/hourly_units.dart';

class Weather {
    double latitude;
    double longitude;
    double generationtimeMs;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    int elevation;
    HourlyUnits hourlyUnits;
    Hourly hourly;
    DailyUnits dailyUnits;
    Daily daily;

  Weather({
      required this.latitude,
      required this.longitude,
      required this.generationtimeMs,
      required this.utcOffsetSeconds,
      required this.timezone,
      required this.timezoneAbbreviation,
      required this.elevation,
      required this.hourlyUnits,
      required this.hourly,
      required this.dailyUnits,
      required this.daily
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      latitude: json['latitude'],
      longitude: json['longitude'],
      generationtimeMs: json['generationtimeMs'],
      utcOffsetSeconds: json['utcOffsetSeconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezoneAbbreviation'],
      elevation: json['elevation'],
      hourlyUnits: HourlyUnits.fromJson(json['hourlyUnits']),
      hourly: Hourly.fromJson(json['hourly']),
      dailyUnits: DailyUnits.fromJson(json['dailyUnits']),
      daily: Daily.fromJson(json['daily']),
    );
  }

// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'weather.freezed.dart';
// part 'weather.g.dart';
//
// @freezed
// abstract class Weather with _$Weather {
//   const factory Weather({
//     required double latitude,
//     required double longitude,
//     required List<double> temperature2m,
//     required List<int> precipitationProbability,
//     required List<int> relativeHumidity2m,
//     required List<double> rain,
//     required List<double> apparentTemperature,
//   }) = _Weather;
//
//   factory Weather.fromJson(Map<String, Object?> json) =>
//       _$WeatherFromJson(json);
// }

// @freezed
// class WeatherModel {
//   final double latitude;
//   final double longitude;
//   final List<double> temperature2m;
//   final List<int> precipitationProbability;
//   final List<int> relativeHumidity2m;
//   final List<double> rain;
//   final List<double> apparentTemperature;
//
//   WeatherModel({
//     required this.latitude,
//     required this.longitude,
//     required this.temperature2m,
//     required this.precipitationProbability,
//     required this.relativeHumidity2m,
//     required this.rain,
//     required this.apparentTemperature,
//   });
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     final hourly = json['hourly'] as Map<String, dynamic>;
//
//     return WeatherModel(
//       latitude: (json['latitude'] as num).toDouble(),
//       longitude: (json['longitude'] as num).toDouble(),
//       temperature2m: List<double>.from(
//         (hourly['temperature_2m'] as List).map((e) => (e as num).toDouble()),
//       ),
//       precipitationProbability: List<int>.from(
//         hourly['precipitation_probability'],
//       ),
//       relativeHumidity2m: List<int>.from(
//         hourly['relative_humidity_2m'],
//       ),
//       rain: List<double>.from(
//         (hourly['rain'] as List).map((e) => (e as num).toDouble()),
//       ),
//       apparentTemperature: List<double>.from(
//         (hourly['apparent_temperature'] as List)
//             .map((e) => (e as num).toDouble()),
//       ),
//     );
//   }
// }

