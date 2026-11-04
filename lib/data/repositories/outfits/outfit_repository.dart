import 'package:android/domain/models/clothes/cloth.dart';

abstract class OutfitRepository {
  Future<Cloth> getCloth(String category); 
}
