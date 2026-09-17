import 'package:android/constant.dart';
import 'package:android/weather/models/weather_model.dart';
import 'package:android/weather/services/weather_service.dart';
import 'package:flutter/material.dart';

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
      body: FutureBuilder<WeatherModel?>(
      future: WeatherService().fetchWeather(52.52, 13.41), 
      builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}" ));
            } else if (!snapshot.hasData) {
                return const Center(child: Text("No Weather found"));
              } else {
                  final weather = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        subtitle: Text(
                          '${weather.temperature2m[0]}%',
                      ),
                      ),
                    )
                  );
                }
        })
      
    );
  }
}
