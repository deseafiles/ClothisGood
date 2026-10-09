// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherApiModel _$WeatherApiModelFromJson(Map<String, dynamic> json) =>
    _WeatherApiModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      temperature2m: (json['temperature2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      precipitationProbability:
          (json['precipitationProbability'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      relativeHumidity2m: (json['relativeHumidity2m'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      rain: (json['rain'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      apparentTemperature: (json['apparentTemperature'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$WeatherApiModelToJson(_WeatherApiModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'temperature2m': instance.temperature2m,
      'precipitationProbability': instance.precipitationProbability,
      'relativeHumidity2m': instance.relativeHumidity2m,
      'rain': instance.rain,
      'apparentTemperature': instance.apparentTemperature,
    };
