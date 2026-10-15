import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';

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
              child: Text('Dressed your way..', style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 36.0,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                
              ),)
            ),

            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('Little preferences. A better daily fit.', style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                
              ),
            )
          ),
        ]
      )
    );
  }
}
