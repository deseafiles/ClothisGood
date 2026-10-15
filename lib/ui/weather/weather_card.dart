import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_pin, size: 18, color: AppColors.primary,),
                  const SizedBox(width: 4),

                  Text('Karang Joang, Balikpapan', style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    ),
                  ),

                ]
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('Today', style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                )),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text('18°', style: TextStyle(
                fontSize: 50,
                height: 1,
                  color: AppColors.textPrimary
                ),
              ),
              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Partly cloudy', style: TextStyle(
                    color: AppColors.textPrimary,
                  )),
                  Text('Feels like 16°. H 20 / L 13', style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                  ))
                  ]
                ),
              ],),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.cloud_rounded, size: 34, color: AppColors.primary),
              )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.water_drop_rounded, size: 16, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Rain 10%', style: TextStyle(fontSize: 12, color: AppColors.textSecondary))
              ]
            ),
            Row(
              children: [
                Icon(Icons.opacity_rounded, size: 16, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Humidity 78%', style: TextStyle(fontSize: 12, color: AppColors.textSecondary))
              ]
            ),
            Row(
              children: [
                Icon(Icons.air_rounded, size: 16, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Wind 12 km/h', style: TextStyle(fontSize: 12, color: AppColors.textSecondary))
              ]
            )
          ],
        )
        ],

      ),

    );
  }
}
