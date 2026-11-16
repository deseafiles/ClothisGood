import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/data/repositories/outfits/outfit_repository_impl.dart';
import 'package:android/data/repositories/weathers/weather_repository_impl.dart';
import 'package:android/data/services/api/cloth/cloth_api_service.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final outfitRepositoryProvider = Provider<OutfitRepository>((ref) {
    return OutfitRepositoryImpl(ClothApiService());
  });

final getOutfitProvider = FutureProvider<Cloth>((ref) {
    final controller = ref.watch(outfitRepositoryProvider);
    final category = 'Outfit'; 
    return controller.getCloth(category);
  });

final searchOutfitProvider = FutureProvider.family<Cloth, String>((ref, keyword) {
  final controller = ref.watch(outfitRepositoryProvider);

  final category = 'outfit $keyword';

  return controller.getCloth(category);
});

final getClothPaginateProvider =
    FutureProvider.family<ClothPage, int>((ref, page) {
  final controller = ref.watch(outfitRepositoryProvider);

  const category = 'outfit';

  return controller.getClothPaginate(
    category,
    page: page,
  );
});

final clothCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(
    getClothPaginateProvider(1),
  ).whenData(
    (pageData) => pageData.totalPages,
  );
});
