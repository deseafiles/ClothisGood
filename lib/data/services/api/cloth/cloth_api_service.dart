import 'package:android/data/services/api/api_client.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ClothApiService {
  Future<ClothPage> getClothPaginate(
    String category, {
    int page = 1,  
  }) async {
    final perPage = 10;

    final api = ApiClient();

    String clientId = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';

    if (clientId.isEmpty) {
      throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
    }

final url =
    'api.unsplash.com/search/photos?page=$page&per_page=$perPage&query=${Uri.encodeQueryComponent(category)}&content_filter=low&client_id=$clientId';

print('REQUEST PAGE: $page');
print('REQUEST URL: $url');

final Map<String, dynamic> data = await api.get(url);

print('TOTAL PAGES: ${data['total_pages']}');
print('FIRST PHOTO ID: ${data['results'][0]['id']}');

return ClothPage.fromJson(data);
    }

 Future<Cloth> getCloth(String category) async {
    final api = ApiClient();
    final clientId = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';

    if (clientId.isEmpty) {
      throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
    }

    final data = await api.get(
      'api.unsplash.com/photos/random?query=${Uri.encodeQueryComponent(category)}&content_filter=low&client_id=$clientId',
    );

    return Cloth.fromJson(data);
  }
  
  Future<Cloth> getClothById(String id) async {
      final api = ApiClient();
      final clientId = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';

      if (clientId.isEmpty) {
        throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
      }

      final data = await api.get(
        'api.unsplash.com/photos/$id?client_id=$clientId',
      );

      return Cloth.fromJson(data);
    }
}
