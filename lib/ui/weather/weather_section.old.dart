import 'package:android/domain/models/weathers/selected_location.dart';
import 'package:flutter/material.dart';

import 'weather_card.old.dart';
import '../weather_card.dart';

class WeatherSection extends StatefulWidget {
  const WeatherSection({super.key});

  @override
  State<WeatherSection> createState() => _WeatherSectionState();
}

class _WeatherSectionState extends State<WeatherSection> {
  SelectedLocation? _selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherIcon(locationName: _selected?.name),
        const SizedBox(height: 8),
        WeatherCard(
          onLocationChanged: (location) {
            setState(() => _selected = location);
          },
        ),
      ],
    );
  }
}
