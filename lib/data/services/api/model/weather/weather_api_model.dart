import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_api_model.freezed.dart';
part 'weather_api_model.g.dart';

@freezed
abstract class WeatherApiModel with _$WeatherApiModel {
  const factory WeatherApiModel({
    required double latitude,
    required double longitude,
    required List<double> temperature2m,
    required List<int> precipitationProbability,
    required List<int> relativeHumidity2m,
    required List<double> rain,
    required List<double> apparentTemperature,
  }) = _WeatherApiModel;

  factory WeatherApiModel.fromJson(Map<String, Object?> json) =>
      _$WeatherApiModelFromJson(json);
}
