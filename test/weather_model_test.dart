
import 'package:flutter_test/flutter_test.dart';
import 'package:android/domain/models/weathers/weather.dart';

void main() {
  group('Weather.fromJson', () {
    test('should parse JSON into Weather object', () {
      // Arrange
      final json = <String, dynamic>{
        'latitude': -1.15,
        'longitude': 116.85,
        'generationtimeMs': 0.25,
        'utcOffsetSeconds': 28800,
        'timezone': 'Asia/Makassar',
        'timezoneAbbreviation': 'GMT+8',
        'elevation': 15,

        'hourlyUnits': {
          'time': 'iso8601',
          'temperature2m': '°C',
          'uvIndex': '',
          'apparentTemperature': '°C',
          'precipitationProbability': '%',
          'relativeHumidity2m': '%',
          'windSpeed10m': 'km/h',
          'weatherCode': 'wmo code',
        },

        'hourly': {
          'time': [
            '2026-10-16T14:00',
            '2026-10-16T15:00',
          ],
          'temperature2m': [30.5, 31.0],
          'uvIndex': [5, 6],
          'apparentTemperature': [34.0, 35.0],
          'precipitationProbability': [10, 20],
          'relativeHumidity2m': [78, 75],
          'windSpeed10m': [12.0, 14.5],
          'weatherCode': [2, 3],
        },

        'dailyUnits': {
          'time': 'iso8601',
          'temperature_2m_max': '°C',
          'temperature_2m_min': '°C',
        },

        'daily': {
          'time': ['2026-10-16', '2026-10-17'],
          'temperature2mMax': [32.5, 33.0],
          'temperature2mMin': [24, 25],
        },
      };

      // Act
      final weather = Weather.fromJson(json);

      // Assert: Weather properties
      expect(weather.latitude, -1.15);
      expect(weather.longitude, 116.85);
      expect(weather.generationtimeMs, 0.25);
      expect(weather.utcOffsetSeconds, 28800);
      expect(weather.timezone, 'Asia/Makassar');
      expect(weather.timezoneAbbreviation, 'GMT+8');
      expect(weather.elevation, 15);

      // Assert: HourlyUnits
      expect(weather.hourlyUnits.temperature2m, '°C');
      expect(weather.hourlyUnits.uvIndex, '');
      expect(weather.hourlyUnits.windSpeed10m, 'km/h');

      // Assert: Hourly
      expect(weather.hourly.time.length, 2);
      expect(weather.hourly.temperature2m, [30.5, 31.0]);
      expect(weather.hourly.uvIndex, [5, 6]);
      expect(weather.hourly.apparentTemperature, [34.0, 35.0]);
      expect(weather.hourly.precipitationProbability, [10, 20]);
      expect(weather.hourly.relativeHumidity2m, [78, 75]);
      expect(weather.hourly.windSpeed10m, [12.0, 14.5]);
      expect(weather.hourly.weatherCode, [2, 3]);

      // Assert: DailyUnits
      expect(weather.dailyUnits.time, 'iso8601');
      expect(weather.dailyUnits.temperature2mMax, '°C');
      expect(weather.dailyUnits.temperature2mMin, '°C');

      // Assert: Daily
      expect(weather.daily.time, ['2026-10-16', '2026-10-17']);
      expect(weather.daily.temperature2mMax, [32.5, 33.0]);
      expect(weather.daily.temperature2mMin, [24, 25]);
    });
  });
}
