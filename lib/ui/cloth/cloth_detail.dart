import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class ClothDetail extends StatefulWidget {
  const ClothDetail({super.key});

  @override
  State<ClothDetail> createState() => _ClothDetailState();
}

class _ClothDetailState extends State<ClothDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Outfit Detail')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child:
              // ClipRRect(
              // borderRadius: BorderRadius.circular(14),
                // child:
              Column(
                children: [
                  Text('Nama Baju', style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Inter',
                    color: AppColors.textSecondary,
                    
                  )),
                  ClipRRect(
                    child:
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    ),


                  ),
                ],
              )

              ),
          // ) 
        ],
      ) 
    );
  }
}
