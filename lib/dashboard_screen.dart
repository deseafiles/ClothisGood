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
          const Text('Balikpapan, x°C'),
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
        future: GeolocatorService().getCurrentLocation(),
        builder: (context, locationSnapshot) {
          if (locationSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (locationSnapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${locationSnapshot.error}',
              ),
            );
          } else if (!locationSnapshot.hasData) {
            return const Center(
              child: Text('Location not found'),
            );
          } else {
            final position = locationSnapshot.data!;

            return FutureBuilder<WeatherModel?>(
              future: WeatherService().fetchWeather(
                position.latitude,
                position.longitude,
              ),
              builder: (context, weatherSnapshot) {
                if (weatherSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (weatherSnapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${weatherSnapshot.error}',
                    ),
                  );
                } else if (!weatherSnapshot.hasData) {
                  return const Center(
                    child: Text('No Weather found'),
                  );
                } else {
                  final weather = weatherSnapshot.data!;

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          '${weather.temperature2m[0]}°C',
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
      
    );
  }
}
