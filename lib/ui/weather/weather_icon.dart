import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatefulWidget {
  const WeatherIcon({super.key});

  @override
  State<WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        spacing: 10,
        children: [
          Text('Karang Joang', style: TextStyle(
            letterSpacing: 0.4,
            color: AppColors.textSecondary
            )
          ),

          Icon(Icons.cloud_rounded, color: AppColors.primary),
        ],
      )
    );
  }
}
