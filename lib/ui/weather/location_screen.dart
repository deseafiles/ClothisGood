import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String selectedLocation = 'Karang Joang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Find Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your location',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lora',
                color: AppColors.primary,
              ),
            ),
            Card(
              child: RadioListTile<String>(
                value: 'Karang Joang',
                groupValue: selectedLocation,
                activeColor: AppColors.primary,
                secondary: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                ),
                title: Text(
                  'Karang Joang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: AppColors.textSecondary,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value!;
                  });
                },
              ),
            ),
            Card(
              child: RadioListTile<String>(
                value: 'Batu Ampar',
                groupValue: selectedLocation,
                activeColor: AppColors.primary,
                secondary: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                ),
                title: Text(
                  'Batu Ampar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: AppColors.textSecondary,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
