import 'package:android/controller/weather/weather_controller.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard({super.key});

  static const _location = (lat: 48.8566, lon: 2.3522);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider(_location));

    return weatherAsync.when(
      loading: () => Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.pinkLight,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
          debugPrintStack(stackTrace: stackTrace, maxFrames: 8);
          debugPrint('WeatherError: $error');
        return Container(
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.pinkLight,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off_rounded),
              const SizedBox(height: 8),
              const Text('Gagal memuat data cuaca'),
              TextButton(
                onPressed: () => ref.invalidate(weatherProvider(_location)),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      );
        }, 
      data: (weather) {
        final hourly = weather.hourly;
        final daily = weather.daily;

        // Cari indeks jam yang sesuai dengan waktu sekarang.
        // Bekerja untuk List<DateTime> maupun List<String>.
        final now = DateTime.now();
        int index = hourly.time.indexWhere((e) {
          final Object value = e;
          final t = value is DateTime ? value : DateTime.parse(value.toString());
          return t.year == now.year &&
              t.month == now.month &&
              t.day == now.day &&
              t.hour == now.hour;
        });
        if (index == -1) index = 0;

        final temperature = hourly.temperature2m[index];
        final feelsLike = hourly.apparentTemperature[index];
        final humidity = hourly.relativeHumidity2m[index];
        final rain = hourly.precipitationProbability[index];
        final wind = hourly.windSpeed10m[index];

        final maxTemperature = daily.temperature2mMax.first;
        final minTemperature = daily.temperature2mMin.first;

        return Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.pinkLight,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Karang Joang, Balikpapan',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${temperature.round()}°',
                        style: const TextStyle(
                          fontSize: 50,
                          height: 1,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Current weather',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Feels like ${feelsLike.round()}°',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'H ${maxTemperature.round()}° / '
                            'L ${minTemperature.round()}°',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.cloud_rounded,
                      size: 34,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _WeatherInfo(
                    icon: Icons.water_drop_rounded,
                    label: 'Rain ${rain.round()}%',
                  ),
                  _WeatherInfo(
                    icon: Icons.opacity_rounded,
                    label: 'Humidity ${humidity.round()}%',
                  ),
                  _WeatherInfo(
                    icon: Icons.air_rounded,
                    label: 'Wind ${wind.round()} km/h',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  const _WeatherInfo({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.primary,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
