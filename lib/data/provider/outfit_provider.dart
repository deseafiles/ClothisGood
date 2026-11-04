import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/data/repositories/outfits/outfit_repository_impl.dart';
import 'package:android/data/repositories/weathers/weather_repository_impl.dart';
import 'package:android/data/services/api/cloth/cloth_api_service.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final outfitRepositoryProvider = Provider<OutfitRepository>((ref) {
    return OutfitRepositoryImpl(ClothApiService());
  });

final getOutfitProvider = FutureProvider<Cloth>((ref) {
    final controller = ref.watch(outfitRepositoryProvider);
    final category = 'Outfit'; 
    return controller.getCloth(category);
  });


