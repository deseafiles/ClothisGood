import 'package:android/data/provider/outfit_provider.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClothCard extends ConsumerStatefulWidget {
  const ClothCard({super.key});

  @override
  ConsumerState<ClothCard> createState() => _ClothCardState();
}

// Future<void> goToWebPage(String urlString) async {
//     final Uri _url = Uri.parse(urlString);
//     if (!await launchUrl(_url)) {
//         throw 'Could not launch $_url';
//       }
//   }

class _ClothCardState extends ConsumerState<ClothCard> {
  @override
  Widget build(BuildContext context) {
    final dataCloth = ref.watch(getOutfitProvider);

    return dataCloth.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
      data: (outfit) {
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
                context.push('/cloth-detail');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        outfit.urls.small,
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
                            outfit.user.username,
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
      },
    );
  }
}
