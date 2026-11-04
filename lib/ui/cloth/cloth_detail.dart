import 'package:android/data/provider/outfit_provider.dart';
import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClothDetail extends ConsumerStatefulWidget {
  const ClothDetail({super.key});

  @override
  ConsumerState<ClothDetail> createState() => _ClothDetailState();
}

Future<void> goToWebPage(String urlString) async {
  final Uri url = Uri.parse(urlString);

  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

class _ClothDetailState extends ConsumerState<ClothDetail> {
  @override
  Widget build(BuildContext context) {
    final dataCloth = ref.watch(getOutfitProvider);

    return dataCloth.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),

      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),

      data: (outfit) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            title: Text(
              'Outfit Detail',
              style: TextStyle(
                fontFamily: 'Inter',
                color: AppColors.primary,
              ),
            ),
            centerTitle: true,
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                spacing: 16,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      outfit.urls.regular,
                      width: double.infinity,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                           '${outfit.altDescription}',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Lora',
                            color: AppColors.textPrimary,
                          ),
                        ),

                        Text(
                          'Photography by ${outfit.user.username}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lora',
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    color: AppColors.primary.withOpacity(0.3),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Outfit Source',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      TextButton.icon(
                        onPressed: () {
                          goToWebPage('${outfit.urls}');
                        },
                        icon: Icon(
                          Icons.open_in_new,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        label: Text(
                          'Visit Source',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
