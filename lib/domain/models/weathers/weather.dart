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
  double elevation;
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
    required this.daily,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
        generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
        utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
        timezone: json['timezone'] as String,
        timezoneAbbreviation: json['timezone_abbreviation'] as String,
        elevation: (json['elevation'] as num).toDouble(),
        hourlyUnits: HourlyUnits.fromJson(json['hourly_units']),
        hourly: Hourly.fromJson(json['hourly']),
        dailyUnits: DailyUnits.fromJson(json['daily_units']),
        daily: Daily.fromJson(json['daily']),
      );

}

