import 'package:android/domain/models/weathers/weather_location_selected.dart';
import 'package:android/ui/home/widgets/setting_item.dart';
import 'package:android/ui/provider/weather_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'ClothisGood',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            letterSpacing: 3,
            color: AppColors.primary,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Dressed your way.',
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 28,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Little preferences. A better daily fit.',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 13,
                letterSpacing: 2,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Settings
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                const Text(
                  'Weather & location',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: 'Inter',
                    color: AppColors.primary,
                  ),
                ),

                // Location
                SettingBarItem(
                  icon: const Icon(
                    Icons.location_pin,
                    color: AppColors.primary,
                  ),
                  name: 'Location',
                  onPressed: () async {
                    final currentSelection =
                        ref.read(selectedWeatherLocationProvider);

                    final result =
                        await context.push<WeatherLocationSelected>(
                      '/find-location',
                      extra: currentSelection,
                    );

                    if (!mounted) return;

                    if (result != null) {
                      ref
                          .read(selectedWeatherLocationProvider.notifier)
                          .state = result;
                    }
                  },
                ),

                const SizedBox(height: 12),

                const Text(
                  'App settings',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: 'Inter',
                    color: AppColors.primary,
                  ),
                ),

                // Privacy
                SettingBarItem(
                  icon: const Icon(
                    Icons.privacy_tip_rounded,
                    color: AppColors.primary,
                  ),
                  name: 'Privacy & permissions',
                  value: '',
                  onPressed: () {
                    context.push('/privacy-policy');
                  },
                ),
              ],
            ),
          ),

          const Spacer(),

          // Footer
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ClothisGood',
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 4,
                    fontFamily: 'Inter',
                    color: AppColors.primary,
                  ),
                ),

                Text(
                  'Version 1.0 - Styled for your outfit based on weather.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Lora',
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
