import 'package:android/data/datasources/api/api_client.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:android/domain/models/weathers/current_weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//getClothWithPaginate: untuk data yang ditaro di homepahe supaya bisa paginate yang udah disesuaikan dengan kondisi cuaca saat ini
// getRandomPhotos: bisa digunakan untuk melakukan pencarian baju terlebih dahulu, baru passing category sebagai pencarian barang
//getClothById: untuk dapat detail dari outfit

class ClothApiService {
  final api = ApiClient();
  final perPage = 10;
  
  String clientId = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';


  Future<ClothPage> getClothWithPaginate(
    String category, 
    CurrentWeather weather, 
    {int page = 1}
  ) async {
    if (clientId.isEmpty) {
       throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
    }
     
    final request = 'api.unsplash.com/search/photos?page=$page&per_page=$perPage&query=$category&content_filter=low&client_id=$clientId';

    if (clientId.isEmpty) {
       throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
    }
     
    
    print('Request URL: $request');

    final Map<String, dynamic> data = await api.get(request);

    print('TOTAL PAGES: ${data['total_pages']}');

    return ClothPage.fromJson(data);
    }

  Future<ClothPage> getRandomPhotos(
    String category,
    {int page = 1} 
  ) async {
    
    if (clientId.isEmpty) {
       throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
    }
    print('MASUK KE SEARCH SCREEN');
    final request = 'api.unsplash.com/search/photos?page=$page&per_page=$perPage&query=$category&content_filter=low&client_id=$clientId';
    
    final Map<String, dynamic> data = await api.get(request);

    print(data);
    return ClothPage.fromJson(data);
    }

  Future<Cloth> getClothById(String id) async {
    final request = 'api.unsplash.com/photos/$id?client_id=$clientId';
      
    final Map<String, dynamic> data = await api.get(request);
    
    return Cloth.fromJson(data);
    }
}
