import 'package:android/ui/home/widgets/setting_bar_item.dart';
import 'package:android/ui/home/widgets/setting_text_item.dart';
import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ClothisGood',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                letterSpacing: 3.0,
                color: AppColors.primary,
              ),)
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('Dressed your way.', style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 28.0,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                
              ),)
            ),

            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('Little preferences. A better daily fit.', style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 13.0,
                  letterSpacing: 2.0,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                
              ),
            )
          ),

          Padding(
            padding: EdgeInsets.all(14),
            child: 
              Column(
              spacing: 4,
              children: [
                const Text('Weather & location', style: 
                  TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: 'Inter',
                    color: AppColors.primary)
                    ),
              
                SettingBarItem(icon: Icon(Icons.location_pin, color: AppColors.primary,), name: 'Location', action: SettingTextItem(name: 'Karang Joang', onPressed: () {
                    context.push('/find-location');
                  },)),

                SettingBarItem(icon: Icon(Icons.location_searching_sharp, color: AppColors.primary,), name: 'Use device location', action: SettingTextItem(name: 'ON')),  
                
                const Text('App settings', style: 
                  TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: 'Inter',
                    color: AppColors.primary)
                    ),
                
                SettingBarItem(icon: Icon(Icons.palette_rounded, color: AppColors.primary,), name: 'Appearence', action: SettingTextItem(name: 'Light')),  
                
                // SettingBarItem(icon: Icon(Icons.location_searching_sharp, color: AppColors.primary,), name: 'Language', action: SettingTextItem(name: 'Light')),  
                
                SettingBarItem(icon: Icon(Icons.privacy_tip_rounded, color: AppColors.primary,), name: 'Privacy & permissions', action: SettingTextItem(name: '', onPressed: () {
                    context.push('/privacy-policy');
                  },)),  
               

                const Text('ClothisGood', style: 
                  TextStyle(
                    fontSize: 24,
                    letterSpacing: 4,
                    fontFamily: 'Inter',
                    color: AppColors.primary)
                    ),
                
                const Text('Version 1.0 - Styled for your outfit based on weather.', style: 
                  TextStyle(
                    fontSize: 12,
                    fontFamily: 'Lora',
                    color: AppColors.textSecondary)
                    ),
              ]
            )
          )
        ]
      )
    );
  }
}
