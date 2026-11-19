class LocationData {
  final String name;
  final String district;
  final double latitude;
  final double longitude;

  const LocationData({
    required this.name,
    required this.district,
    required this.latitude,
    required this.longitude,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      name: json['name'],
      district: json['district'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
