import 'package:android/ui/cloth/cloth_card.dart';
import 'package:android/ui/provider/outfit_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ClothListScreen extends ConsumerWidget {
  const ClothListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothCount = ref.watch(clothGetPaginateProvider);

    return clothCount.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
      data: (count) {
        return GridView.builder(
          itemCount: count * 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final currentClothFromIndex = ref.watch(
              getOutfitWithWeatherProvider(index ~/ 10 + 1),
            );

            return currentClothFromIndex.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => const Center(
                child: Icon(Icons.broken_image),
              ),
              data: (pageData) {
                final cloth = pageData.clothes[index % 10];

                return ClothCard(
                  cloth: cloth,
                );
              },
            );
          },
        );
      },
    );
  }
}
