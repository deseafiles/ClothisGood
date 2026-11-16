import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';

abstract class OutfitRepository {
  Future<Cloth> getCloth(String category); 
  Future<ClothPage> getClothPaginate(String category, {int page = 1});
}
