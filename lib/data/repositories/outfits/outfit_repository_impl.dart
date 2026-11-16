import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/data/services/api/cloth/cloth_api_service.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';

class OutfitRepositoryImpl implements OutfitRepository {
  final ClothApiService apiService;

  OutfitRepositoryImpl(this.apiService);

  @override
  Future<Cloth> getCloth(String category) async {
    final response = await apiService.getCloth(category);
    return response;
  }
 @override
  Future<ClothPage> getClothPaginate(String category, {int page = 1}) async {
    final response = await apiService.getClothPaginate(
      category,
      page: page,
    );

    return response;
  }
}
