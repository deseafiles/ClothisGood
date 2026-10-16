class Daily {
  List<String> time;
  List<double> temperature2mMax;
  List<double> temperature2mMin;

  Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: (json['time'] as List).cast<String>(),
        temperature2mMax: (json['temperature_2m_max'] as List)
            .map((e) => (e as num).toDouble())
            .toList(),
        temperature2mMin: (json['temperature_2m_min'] as List)
            .map((e) => (e as num).toDouble())
            .toList(),
      );
}
