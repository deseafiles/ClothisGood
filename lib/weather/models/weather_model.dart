class WeatherModel {
  final double latitude;
  final double longitude;
  final List<double> temperature2m;
  final List<int> precipitationProbability;
  final List<int> relativeHumidity2m;
  final List<double> rain;
  final List<double> apparentTemperature;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.temperature2m,
    required this.precipitationProbability,
    required this.relativeHumidity2m,
    required this.rain,
    required this.apparentTemperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final hourly = json['hourly'] as Map<String, dynamic>;

    return WeatherModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      temperature2m: List<double>.from(
        (hourly['temperature_2m'] as List).map((e) => (e as num).toDouble()),
      ),
      precipitationProbability: List<int>.from(
        hourly['precipitation_probability'],
      ),
      relativeHumidity2m: List<int>.from(
        hourly['relative_humidity_2m'],
      ),
      rain: List<double>.from(
        (hourly['rain'] as List).map((e) => (e as num).toDouble()),
      ),
      apparentTemperature: List<double>.from(
        (hourly['apparent_temperature'] as List)
            .map((e) => (e as num).toDouble()),
      ),
    );
  }
}
