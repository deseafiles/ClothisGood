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
      width: 470,
      height: 150,
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

                  Text('Karang Joang, Balikpapan', style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                ]
              ),

              const Text('Today', style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w300,
              ))
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
                  color: AppColors.textPrimary
                ),
              ),

              Column(
                children: [
                  Text('Partly cloudy', style: TextStyle(
                    color: AppColors.textPrimary,
                  )),
                  Text('Feels like 16°. H 20 / L 13', style: TextStyle(
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
                Icon(Icons.water_rounded),
                Text('Rain 10%')
              ]
            ),
            Row(
              children: [
                Icon(Icons.water_rounded),
                Text('Rain 10%')
              ]
            ),
            Row(
              children: [
                Icon(Icons.water_rounded),
                Text('Rain 10%')
              ]
            )
          ],
        )
        ],

      ),
      
    );
  }
}
