import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/domain/models/clothes/cloth.dart';

class OutfitController {
  final OutfitRepository repository;

  OutfitController(this.repository);

  Future<Cloth> getCloth(String category) async {
      final cloth = await repository.getCloth(category);
      //bisa nambahin bussiness logic di sini
      return cloth;
    }
  
  Future<Cloth> searchCloth(String category, String keyword) async {
      final cloth = await repository.getCloth(category);
      //bisa nambahin bussiness logic di sini
      return cloth;
    }
}
