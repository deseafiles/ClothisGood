import 'package:android/data/services/local/local_geolocator_service.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatefulWidget {
  const WeatherIcon({
    super.key,
    this.locationName,
    this.useGps = false,
  });

  /// Nama kelurahan dari dropdown.
  final String? locationName;

  /// Kalau true, abaikan [locationName] dan pakai GPS perangkat.
  final bool useGps;

  @override
  State<WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon> {
  final GeolocatorService _geolocatorService = GeolocatorService();

  Future<String?>? _gpsNameFuture;

  @override
  void initState() {
    super.initState();
    if (widget.useGps) _gpsNameFuture = _loadGpsName();
  }

  @override
  void didUpdateWidget(covariant WeatherIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.useGps && !oldWidget.useGps) {
      _gpsNameFuture = _loadGpsName();
    }
  }

  Future<String?> _loadGpsName() async {
    final position = await _geolocatorService.getCurrentPosition();
    if (position == null) return null;

    return _geolocatorService.getCurrentLocation(
      position.latitude,
      position.longitude,
    );
  }

  Widget _spinner() => const Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Center(
          child: Text(text, 
            style: TextStyle(
              color: AppColors.primary,
              ) 
            ),
          )
        );

  @override
  Widget build(BuildContext context) {
    // Mode dropdown
    if (!widget.useGps) {
      final name = widget.locationName;
      if (name == null || name.isEmpty) return _spinner();
      return _label(name);
    }

    // Mode GPS
    return FutureBuilder<String?>(
      future: _gpsNameFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _spinner();
        }

        if (snapshot.hasError) {
          debugPrint('LOCATION ERROR: ${snapshot.error}');
          debugPrint('STACK: ${snapshot.stackTrace}');
          return Center(child: Text('${snapshot.error}'));
        }

        final name = snapshot.data;
        if (name == null || name.isEmpty) {
          return const Center(child: Text('Location not found'));
        }

        return _label(name);
      },
    );
  }
}
