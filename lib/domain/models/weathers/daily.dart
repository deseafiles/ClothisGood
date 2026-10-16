class Daily {
  List<String> time;
  List<double> temperature2mMax;
  List<int> temperature2mMin;

  Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json['time'].cast<String>(),
        temperature2mMax: json['temperature2mMax'].cast<double>(),
        temperature2mMin: json['temperature2mMin'].cast<int>(),
      );
}
