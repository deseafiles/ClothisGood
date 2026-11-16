import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClothCard extends StatelessWidget {
  final Cloth cloth;

  const ClothCard({
    super.key,
    required this.cloth,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () {
            context.push('/cloth-detail/${cloth.id}');
            print('cloth-id: ${cloth.id}');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    cloth.urls.small,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.broken_image),
                      );
                    },
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pinkLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        cloth.user.username,
                        style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
