import 'package:android/data/services/api/api_client.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ClothApiService {
 Future<Cloth> getCloth(String category) async {
     final api = ApiService();
      String clientId = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';
      
      print(clientId);
     if (clientId.isEmpty) {
        throw Exception('UNSPLASH_ACCESS_KEY belum diatur');
      }

     final Map<String, dynamic> data = await api.get(
      'api.unsplash.com/photos/random?query=$category&client_id=$clientId'
     );

     print(data);
     return Cloth.fromJson(data);
   } 
}
