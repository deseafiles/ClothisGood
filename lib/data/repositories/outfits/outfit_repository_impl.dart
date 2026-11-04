import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/data/services/api/cloth/cloth_api_service.dart';
import 'package:android/domain/models/clothes/cloth.dart';

class OutfitRepositoryImpl implements OutfitRepository {
  final ClothApiService apiService;

  OutfitRepositoryImpl(this.apiService);

  @override
  Future<Cloth> getCloth(String category) async {
    final response = await apiService.getCloth(category);
    return response;
  }
}
