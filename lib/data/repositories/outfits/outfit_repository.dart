import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:android/domain/models/weathers/current_weather.dart';

abstract class OutfitRepository {
  // untuk get data di homescreen
  Future<ClothPage> getCloth(String category, CurrentWeather weather, {int page = 1});
  //untuk search outfit, jadi alurnya gambar yang muncul bakal random aja gitu, kalau mau search bisa send param category
  Future<ClothPage> searchOutfit(String category, {int page = 1});

  //untuk get detail outfit, return data 1 outfit aja jadi pake model Cloth
  Future<Cloth> getClothById(String id);
}
