class HourlyUnits {
  String time;
  String temperature2m;
  String uvIndex;
  String apparentTemperature;
  String precipitationProbability;
  String relativeHumidity2m;
  String windSpeed10m;
  String weatherCode;

  HourlyUnits({
    required this.time,
    required this.temperature2m,
    required this.uvIndex,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
    required this.weatherCode,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json['time'] as String? ?? '',
        temperature2m: json['temperature_2m'] as String? ?? '',
        uvIndex: json['uv_index'] as String? ?? '',
        apparentTemperature: json['apparent_temperature'] as String? ?? '',
        precipitationProbability:
            json['precipitation_probability'] as String? ?? '',
        relativeHumidity2m: json['relative_humidity_2m'] as String? ?? '',
        windSpeed10m: json['wind_speed_10m'] as String? ?? '',
        weatherCode: json['weather_code'] as String? ?? '',
      );
}
