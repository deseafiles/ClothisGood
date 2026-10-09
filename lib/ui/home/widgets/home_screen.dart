import 'package:android/data/services/api/api_client.dart';
import 'package:android/ui/home/widgets/navigation_app_bar.dart';
import 'package:android/ui/home/widgets/weather_icon.dart';
import 'package:android/utils/constant.dart';
import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/data/services/local/local_geolocator_service.dart';
import 'package:android/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<HomeScreen> {
  late final Future<Position?> _positionFuture;

  Future<Result<Weather>>? _weatherFuture;

  @override
  void initState() {
    super.initState();
    _positionFuture = GeolocatorService().getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigationAppBar(),
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
        actions: [ const WeatherIcon()
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Position?>(
            future: _positionFuture,
            builder: (context, locationSnapshot) {
              if (locationSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (locationSnapshot.hasError) {
                return Center(child: Text('Error: ${locationSnapshot.error}'));
              }

              if (!locationSnapshot.hasData || locationSnapshot.data == null) {
                return const Center(child: Text('Location not found'));
              }

              final position = locationSnapshot.data!;

              _weatherFuture ??= ApiClient().getWeather(
                position.latitude,
                position.longitude,
              );

              return FutureBuilder<Result<Weather>?>(
                future: _weatherFuture,
                builder: (context, weatherSnapshot) {
                  if (weatherSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (weatherSnapshot.hasError) {
                    return Center(child: Text('Error: ${weatherSnapshot.error}'));
                  }

                  if (!weatherSnapshot.hasData || weatherSnapshot.data == null) {
                    return const Center(child: Text('No Weather found'));
                  }

                  final weatherData = weatherSnapshot.data! as Ok<Weather>;
                  final weather = weatherData.value;

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(title: Text('${weather.temperature2m[0]}°C')),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: const WeatherIcon(),
        )
      ],
    ) 
  );
}}
