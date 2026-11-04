import 'package:android/data/provider/weather_provider.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//consumer widget digunakna oleh stateless widget, sedangkan consumerstatefulwidget digunakan oleh statefulwidhet

class WeatherCard extends ConsumerStatefulWidget {
  const WeatherCard({super.key});

  @override
  ConsumerState<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends ConsumerState<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    final dataWeather = ref.watch(getWeatherProvider);
    final dataLocation = ref.watch(getLocationProvider);
   
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

        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.pinkLight,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.pinkLight,
                
              )
            ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_pin, color: AppColors.primary,),

                      Text(location, style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                    ]
                  ),

                  Text('UV Index ${weather.hourly.uvIndex[0]}', style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w300,
                  ))
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text('${weather.hourly.temperature2m[0].round()}°', style: TextStyle(
                    fontSize: 50,
                      color: AppColors.textPrimary
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Partly cloudy', style: TextStyle(
                        color: AppColors.textPrimary,
                      )),
                      Text('Feels like ${weather.hourly.apparentTemperature[0]}°. H ${weather.daily.temperature2mMax[0]} / L ${weather.daily.temperature2mMin[0]}', style: TextStyle(
                          color: AppColors.textSecondary, 
                      ))
                      ]
                    ),
                  ],),
                  
                  Icon(Icons.cloud_rounded, size: 50, color: AppColors.primary)
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop_rounded, color: AppColors.primary),
                    Text('Rain ${weather.hourly.precipitationProbability[0]}%', style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),)
                  ]
                ),
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.water_rounded, color: AppColors.primary),
                    Text('Humidity ${weather.hourly.relativeHumidity2m[0]}%', style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 14,

                    ),)
                  ]
                ),
                Row(
                  children: [
                    Icon(Icons.air_rounded, color: AppColors.primary),
                    Text('Wind ${weather.hourly.windSpeed10m[0]} km/h', style: TextStyle(
                      color: AppColors.textPrimary,
                      fontFamily: 'Inter',
                      fontSize: 14,

                    ))
                  ]
                )
              ],
            )
            ],

          ),
        );
      }    //atas batas container
    );
  // final weather = await controller.getWeather(lat, lon);
  }
}

