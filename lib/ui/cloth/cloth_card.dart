import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  height: 50,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('The effortless layer', style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary
                    )),
                  ),

                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_outward, size: 16, color: AppColors.primary),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Text('Light trench + cotton tee + straight jeans...', style: TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                height: 1.4,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
