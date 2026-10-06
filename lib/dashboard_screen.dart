import 'package:android/constant.dart';
import 'package:android/weather/models/weather_model.dart';
import 'package:android/weather/services/geolocator_service.dart';
import 'package:android/weather/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final Future<Position?> _positionFuture;

  Future<String?>? _addressFuture;
  Future<WeatherModel?>? _weatherFuture;

  @override
  void initState() {
    super.initState();
    _positionFuture = GeolocatorService().getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ClothisGood',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 1.5,
                color: AppColors.primary,
              ),
            ),
            Text(
              "Let's find your style!",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          FutureBuilder<Position?>(
            future: _positionFuture,
            builder: (context, locationSnapshot) {
              if (locationSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }

              if (locationSnapshot.hasError) {
                return const Center(
                  child: Text('Location error'),
                );
              }

              if (!locationSnapshot.hasData ||
                  locationSnapshot.data == null) {
                return const Center(
                  child: Text('Location not found'),
                );
              }

              final position = locationSnapshot.data!;

              _addressFuture ??=
                  GeolocatorService().getCurrentLocation(position);

              return FutureBuilder<String?>(
                future: _addressFuture,
                builder: (context, addressSnapshot) {
                  if (addressSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }

                  if (addressSnapshot.hasError) {
                    debugPrint('ADDRESS ERROR: ${addressSnapshot.error}');
                    debugPrint('STACK: ${addressSnapshot.stackTrace}');
                    return const Center(
                      child: Text('Address error'),
                    );
                  }

                  if (!addressSnapshot.hasData ||
                      addressSnapshot.data == null) {
                    return const Center(
                      child: Text('Location not found'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: Text(addressSnapshot.data!),
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Choosing Weather.'),
                ),
              );
            },
            icon: const Icon(
              Icons.cloud_circle,
              color: AppColors.surface,
              size: 40,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Position?>(
        future: _positionFuture,
        builder: (context, locationSnapshot) {
          if (locationSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (locationSnapshot.hasError) {
            return Center(
              child: Text('Error: ${locationSnapshot.error}'),
            );
          }

          if (!locationSnapshot.hasData || locationSnapshot.data == null) {
            return const Center(
              child: Text('Location not found'),
            );
          }

          final position = locationSnapshot.data!;

          _weatherFuture ??= WeatherService().fetchWeather(
            position.latitude,
            position.longitude,
          );

          return FutureBuilder<WeatherModel?>(
            future: _weatherFuture,
            builder: (context, weatherSnapshot) {
              if (weatherSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (weatherSnapshot.hasError) {
                return Center(
                  child: Text('Error: ${weatherSnapshot.error}'),
                );
              }

              if (!weatherSnapshot.hasData || weatherSnapshot.data == null) {
                return const Center(
                  child: Text('No Weather found'),
                );
              }

              final weather = weatherSnapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text('${weather.temperature2m[0]}°C'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
