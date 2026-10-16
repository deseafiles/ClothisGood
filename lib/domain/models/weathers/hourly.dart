class Hourly {
  List<String> time;
  List<double> temperature2m;
  List<int> uvIndex;
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
 
  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    time: json['time'].cast<String>(),
    temperature2m: json['temperature2m'].cast<double>(),
    uvIndex: json['uvIndex'].cast<int>(),
    apparentTemperature: json['apparentTemperature'].cast<double>(),
    precipitationProbability: json['precipitationProbability'].cast<int>(),
    relativeHumidity2m: json['relativeHumidity2m'].cast<int>(),
    windSpeed10m: json['windSpeed10m'].cast<double>(),
    weatherCode: json['weatherCode'].cast<int>(),
  );

}
