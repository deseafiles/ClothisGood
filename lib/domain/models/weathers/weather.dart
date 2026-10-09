import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required double latitude,
    required double longitude,
    required List<double> temperature2m,
    required List<int> precipitationProbability,
    required List<int> relativeHumidity2m,
    required List<double> rain,
    required List<double> apparentTemperature,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);

  static List<Weather> listFromJson(List<Map<String, Object?>> json) =>
      json.map((i) => _$WeatherFromJson(i)).toList();
}

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

