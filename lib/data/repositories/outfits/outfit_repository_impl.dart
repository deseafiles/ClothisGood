import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/data/datasources/api/cloth/cloth_api_service.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:android/domain/models/weathers/current_weather.dart';

class OutfitRepositoryImpl implements OutfitRepository {
  final ClothApiService apiService;

  OutfitRepositoryImpl(this.apiService);
  
  // untuk get data di homescreen
  @override
  Future<ClothPage> getCloth(String category, CurrentWeather weather, {int page = 1}) async {
    final response = await apiService.getClothWithPaginate(
      category,
      weather,
      page: page,
    );

    return response;
  }

  //untuk get detail outfit

  @override
  Future<Cloth> getClothById(String id) async {
      final response = await apiService.getClothById(id);
      return response;
    }

  @override
  Future <ClothPage> searchOutfit(
    String category, {
        int page = 1,
    }) async {
        final response = await apiService.getRandomPhotos(
          category,
          page: page,
          );

        return response;
      } 
}
