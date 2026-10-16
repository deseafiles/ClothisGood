class DailyUnits {
  String time;
  String temperature2mMax;
  String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json['time'],
        temperature2mMax: json['temperature_2m_max'],
        temperature2mMin: json['temperature_2m_min'],
      );
}
