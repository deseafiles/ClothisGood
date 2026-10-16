class Hourly {
  List<String> time;
  List<double> temperature2m;
  List<double> uvIndex;
  List<double> apparentTemperature;
  List<int> precipitationProbability;
  List<int> relativeHumidity2m;
  List<double> windSpeed10m;
  List<int> weatherCode;

  Hourly({
    required this.time,
    required this.temperature2m,
    required this.uvIndex,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
    required this.weatherCode,
  });

  static List<double> _doubles(dynamic list) => (list as List? ?? [])
      .map((e) => (e as num?)?.toDouble() ?? 0.0)
      .toList();

  static List<int> _ints(dynamic list) => (list as List? ?? [])
      .map((e) => (e as num?)?.toInt() ?? 0)
      .toList();

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: (json['time'] as List).cast<String>(),
        temperature2m: _doubles(json['temperature_2m']),
        uvIndex: _doubles(json['uv_index']),
        apparentTemperature: _doubles(json['apparent_temperature']),
        precipitationProbability: _ints(json['precipitation_probability']),
        relativeHumidity2m: _ints(json['relative_humidity_2m']),
        windSpeed10m: _doubles(json['wind_speed_10m']),
        weatherCode: _ints(json['weather_code']),
      );
}
