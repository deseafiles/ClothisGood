import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClothCard extends StatefulWidget {
  const ClothCard({super.key});

  @override
  State<ClothCard> createState() => _ClothCardState();
}

class _ClothCardState extends State<ClothCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: AppColors.surface,
      child: Center(
        child: Column(
          children: [
            Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', height: 150, width: 150,),
            
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('The effortless layer', style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 20,
                  color: AppColors.textPrimary
                )),

                Icon(Icons.arrow_outward)
              ],
            ),

            Text('Light trench + cotton tee + straight jeans. Finish with sneakers for a day on the go.', style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
            ))
          ],
        )
      )
    );
  }
}
