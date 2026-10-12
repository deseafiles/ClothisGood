import 'dart:convert';

import 'package:android/domain/models/weathers/selected_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key, this.onLocationChanged});

  final ValueChanged<SelectedLocation>? onLocationChanged;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  static const String _defaultCity = 'Karang Joang';
  static const String _prefsKey = 'lastCity';

  List<Map<String, dynamic>> locations = [];

  bool isLoading = false;
  String errorMessage = '';
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await readJson();
    await loadLastCity();
  }

  Future<void> readJson() async {
    try {
      final response = await rootBundle.loadString('assets/locations.json');
      final List<dynamic> data = jsonDecode(response);

      if (!mounted) return;

      setState(() {
        locations = data
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Gagal membaca data lokasi: $e';
      });
    }
  }

  Future<void> loadLastCity() async {
    if (locations.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final lastCity = prefs.getString(_prefsKey) ?? _defaultCity;

    if (!mounted) return;

    final exists = locations.any((l) => l['name'] == lastCity);
    final city = exists ? lastCity : locations.first['name'] as String;

    await getWeather(city);
  }

  Future<void> getWeather(String city) async {
    if (city.trim().isEmpty) return;

    final matches = locations.where((item) => item['name'] == city);

    if (matches.isEmpty) {
      setState(() {
        errorMessage = 'Kelurahan tidak ditemukan di JSON.';
      });
      return;
    }

    final data = matches.first;
    final latitude = (data['latitude'] as num).toDouble();
    final longitude = (data['longitude'] as num).toDouble();

    setState(() {
      selectedCity = city;
      errorMessage = '';
    });

    // Beri tahu parent (WeatherIcon ikut berubah).
    widget.onLocationChanged?.call(
      SelectedLocation(
        name: city,
        district: data['district'] as String,
        latitude: latitude,
        longitude: longitude,
      ),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, city);

    // TODO: panggil Open-Meteo dengan latitude & longitude,
    // set isLoading = true sebelum request dan false setelahnya.
    debugPrint('Kelurahan: $city ($latitude, $longitude)');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButtonFormField<String>(
          value: selectedCity,
          decoration: const InputDecoration(
            labelText: 'Pilih kelurahan',
            border: OutlineInputBorder(),
          ),
          items: locations.map((location) {
            final name = location['name'] as String;
            return DropdownMenuItem<String>(
              value: name,
              child: Text('$name (${location['district']})'),
            );
          }).toList(),
          onChanged: (value) {
            if (value == null) return;
            getWeather(value);
          },
        ),
        if (isLoading)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          ),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
