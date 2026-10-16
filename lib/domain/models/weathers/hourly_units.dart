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
        time: json['time'],
        temperature2m: json['temperature2m'],
        uvIndex: json['uvIndex'],
        apparentTemperature: json['apparentTemperature'],
        precipitationProbability: json['precipitationProbability'],
        relativeHumidity2m: json['relativeHumidity2m'],
        windSpeed10m: json['windSpeed10m'],
        weatherCode: json['weatherCode'],
      );
}
