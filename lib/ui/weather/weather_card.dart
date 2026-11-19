import 'package:android/domain/models/weathers/weather_location_selected.dart';
import 'package:android/ui/provider/weather_riverpod.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//consumer widget digunakna oleh stateless widget, sedangkan consumerstatefulwidget digunakan oleh statefulwidhet

class WeatherCard extends ConsumerWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Membaca lokasi yang terakhir disimpan dari SettingScreen.
    final selection = ref.watch(selectedWeatherLocationProvider);

    final useCurrentLocation =
        selection?.useCurrentLocation ?? true;

    final selectedLocation = selection?.location;

    // Memilih sumber data cuaca.
    final dataWeather = useCurrentLocation
        ? ref.watch(getLangLongProvider)
        : ref.watch(
            getWeatherFromLocationProvider(selectedLocation!),
          );

    // Memilih sumber nama lokasi.
    final dataLocation = useCurrentLocation
        ? ref.watch(getLocationProvider)
        : ref.watch(
            getLocationFromJsonProvider(selectedLocation!),
          );

    return dataWeather.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error : $error'),
      ),
      data: (weather) {
        final location = dataLocation.when(
          data: (location) => location ?? 'Unknown location',
          loading: () => 'Loading location...',
          error: (error, stack) => 'Location unavailable',
        );

        final weatherCode = ref.watch(
          getWeatherCodeProvider(weather),
        );

        return weatherCode.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error $error'),
          ),
          data: (code) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.pinkLight,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pinkLight,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: AppColors.primary,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'UV Index ${weather.uvIndex}',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${weather.temperature}°',
                            style: const TextStyle(
                              fontSize: 50,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                code,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                'Feels like ${weather.apparentTemperature}°. H ${weather.temperatureMax} / L ${weather.temperatureMin}',
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.cloud_rounded,
                        size: 50,
                        color: AppColors.primary,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.water_drop_rounded,
                            color: AppColors.primary,
                          ),
                          Text(
                            'Rain ${weather.precipitationProbability}%',
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          const Icon(
                            Icons.water_rounded,
                            color: AppColors.primary,
                          ),
                          Text(
                            'Humidity ${weather.relativeHumidity}%',
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.air_rounded,
                            color: AppColors.primary,
                          ),
                          Text(
                            'Wind ${weather.windSpeed} km/h',
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
