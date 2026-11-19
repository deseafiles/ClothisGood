import 'package:android/ui/cloth/cloth_card.dart';
import 'package:android/ui/provider/outfit_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ClothSearchList extends ConsumerWidget {
  const ClothSearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyword = ref.watch(searchKeywordProvider);

    // Jika keyword kosong, gunakan pencarian default.
    // Jika ada keyword, gunakan pencarian berdasarkan keyword.
    final clothCount = keyword.isEmpty
        ? ref.watch(clothSearchScreenProvider)
        : ref.watch(clothSearchPaginateProvider((keyword, 1)));

    return clothCount.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
      data: (count) {
        if (count == 0) {
          return const Center(
            child: Text('No outfit found'),
          );
        }

        return GridView.builder(
          itemCount: count * 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final currentPage = index ~/ 10 + 1;
            final currentClothIndex = index % 10;

            // Pilih provider berdasarkan keyword.
            final currentCloth = keyword.isEmpty
                ? ref.watch(outfitSearchScreenProvider(currentPage))
                : ref.watch(searchOutfitProvider((keyword, currentPage)));

            return currentCloth.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => const Center(
                child: Icon(Icons.broken_image),
              ),
              data: (pageData) {
                if (currentClothIndex >= pageData.clothes.length) {
                  return const SizedBox.shrink();
                }

                final cloth = pageData.clothes[currentClothIndex];

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
