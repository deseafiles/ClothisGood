import 'package:android/data/services/api/api_client.dart';
import 'package:android/domain/models/weathers/selected_location.dart';
import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/ui/cloth/cloth_card.dart';
import 'package:android/ui/weather/weather_card.dart';
// import 'package:android/ui/home/widgets/navigation_app_bar.dart';
// import 'package:android/ui/home/widgets/weather_card.dart';
// import 'package:android/ui/home/widgets/weather_icon.dart';
import 'package:android/ui/weather/weather_icon.dart';
import 'package:android/utils/constant.dart';
import 'package:android/utils/result.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SelectedLocation? _selected;
  Future<Result<Weather>>? _weatherFuture;

  void _onLocationChanged(SelectedLocation location) {
    if (!mounted) return;

    setState(() {
      _selected = location;
      _weatherFuture = ApiClient().getWeather(
        location.latitude,
        location.longitude,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // bottomNavigationBar: const NavigationAppBar(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ClothisGood',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                letterSpacing: 3.0,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        // actions: [
        //   WeatherIcon(),
        // ],
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('Good weather. Better outifts.',
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 36.0,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                  )
                )
          ),

          Padding(
              padding: const EdgeInsets.all(10),
              child: WeatherCard(),
            ),

          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text('Your outfit for today', style: TextStyle(
              fontFamily: 'Lora',
              color: AppColors.textPrimary,
              fontSize: 25,
            ))
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: ClothCard())
        ],
        // children: [
        //   Expanded(child: _buildWeatherBody()),
        //   Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: WeatherCard(onLocationChanged: _onLocationChanged),
        //   ),
        // ],
      ),
    );
  }

  Widget _buildWeatherBody() {
    final future = _weatherFuture;

    // Dropdown belum selesai memuat lokasi pertama.
    if (future == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return FutureBuilder<Result<Weather>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final result = snapshot.data;
        if (result == null) {
          return const Center(child: Text('No Weather found'));
        }

        if (result is Ok<Weather>) {
          final weather = result.value;
          final temps = weather.temperature2m;

          if (temps.length <= 2) {
            return const Center(child: Text('No Weather found'));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text('${temps[2]}°C'),
                subtitle: _selected == null
                    ? null
                    : Text('${_selected!.name}, ${_selected!.district}'),
              ),
            ),
          );
        }

        if (result is Error<Weather>) {
          return Center(child: Text('Error: ${result.error}'));
        }

        // Fallback supaya selalu ada return.
        return const Center(child: Text('No Weather found'));
      },
    );
  }
}
