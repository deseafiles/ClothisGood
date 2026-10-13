import 'package:android/ui/cloth/cloth_card.dart';
import 'package:android/ui/home/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              child: Text('Find your outfit that matches your weather.', style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 36.0,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                
              ),)
            ),

            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('A little inspiration for whatever\'s outside.', style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                
              ),)
            ),

            const SearchAppBar(),

            Padding(
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hasil Pencarian'),
                  Text('1 looks')
                ]),
              ),

            const ClothCard(),
        ],
      )
    );
  }
}
