// import 'package:android/data/services/api/api_client.dart';
// import 'package:android/domain/models/weathers/selected_location.dart';
import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/ui/cloth/cloth_card.dart';
import 'package:android/ui/cloth/cloth_list_screen.dart';
import 'package:android/ui/weather/weather_card.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // bottomNavigationBar: const NavigationAppBar(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        forceMaterialTransparency: true,
        title: FittedBox(
            fit: BoxFit.scaleDown,
            child: 
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
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          // children: [
          //   Text(
          //     'ClothisGood',
          //     style: TextStyle(
          //       fontFamily: 'Inter',
          //       fontWeight: FontWeight.w500,
          //       fontSize: 20,
          //       letterSpacing: 3.0,
          //       color: AppColors.primary,
          //     ),
          //   ),
          // ],
        ),
        // actions: [
        //   WeatherIcon(),
        // ],
      ),
      body: SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Good weather. Better outifts.',
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 28.0,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w400,
                    )
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
              fontWeight: FontWeight.w200,
              color: AppColors.textPrimary,
              fontSize: 16,
            ))
          ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 600,
                child: ClothListScreen(),
              )
            ) 
        ],
      ),
      )
    );
  }
}
