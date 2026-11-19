import 'package:android/data/datasources/api/cloth/cloth_api_service.dart';
import 'package:android/data/repositories/outfits/outfit_repository_impl.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:android/services/outfit_service.dart';
import 'package:android/ui/provider/weather_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//ini provider untuk membaca dari controller 
/* type dari provider
1. provider hanya untuk melakukan pembacaan data - read only value.
2. StateProvider: dipake untuk state yang bisa diubah, kaya yang di halaman awal flutter yang kalo dipencet bakal nambah gitu angkanya
3. FutureProvider : dipake untuk handle asyncronous data dari Future - basically dipake untuk data yang dapat dari API.
4. NotifierProvider and AsyncNotifierProvider: bisa menangani hampir semua state aplikasi
*/

// ini provider untuk get semua function dari repository
final outfitServiceProvider = Provider<OutfitService>((ref) {
    
    return OutfitService(OutfitRepositoryImpl(ClothApiService()));
  }); 

// ini provider untuk get outfit paginate ditampilkan di homescreen
//WIP, selesaikan weather dulu
final getOutfitWithWeatherProvider =
    FutureProvider.family<ClothPage, int>((ref, page) async {
  print('MASUK KE OUTFIT PROVIDER');

  final service = ref.watch(outfitServiceProvider);

  final weather = await ref.watch(getLangLongProvider.future);

  const category = 'outfit';

  return service.getClothWithWeather(
    category,
    weather,
    page: page,
  );
});

final clothGetPaginateProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(
    getOutfitWithWeatherProvider(1),
  ).whenData(
    (pageData) => pageData.totalPages,
  );
});

// Search
final searchKeywordProvider = StateProvider<String>((ref) => '');

final searchOutfitProvider =
    FutureProvider.family<ClothPage, (String, int)>((ref, params) async {
  final service = ref.watch(outfitServiceProvider);

  final query = 'outfit ${params.$1}';

  print('SEARCH KEYWORD: ${params.$1}');
  print('SEARCH QUERY: $query');

  final result = await service.searchCloth(
    query,
    page: params.$2,
  );

  print('TOTAL RESULTS: ${result.total}');
  print('TOTAL PAGES: ${result.totalPages}');
  print('CLOTHES LENGTH: ${result.clothes.length}');

  return result;
});

final clothSearchPaginateProvider =
    Provider.family<AsyncValue<int>, (String, int)>((ref, params) {
  return ref.watch(
    searchOutfitProvider(params),
  ).whenData(
    (data) => data.totalPages,
  );
});

// Menampilkan outfit awal
final outfitSearchScreenProvider =
    FutureProvider.family<ClothPage, int>((ref, page) async {
  final service = ref.watch(outfitServiceProvider);

  return service.searchCloth(
    'outfit',
    page: page,
  );
});

final clothSearchScreenProvider =
    Provider<AsyncValue<int>>((ref) {
  return ref.watch(
    outfitSearchScreenProvider(1),
  ).whenData(
    (data) => data.totalPages,
  );
});

//getoutfitby id

final getOutfitByIdProvider = FutureProvider.family<Cloth, String>((ref, id) async {
    final controller = ref.watch(outfitServiceProvider);
    
    return controller.getClothById(id);
  });
