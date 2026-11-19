import 'dart:convert';
import 'dart:io';

class ApiClient {
  // static const baseUrl = 'https://api.open-meteo.com/v1';
  static const baseUrl = 'https:';

  Future<dynamic> get(String path) async {
    final client = HttpClient();

    try {
      final request = await client.getUrl(Uri.parse('$baseUrl//$path'));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      
      if (response.statusCode == 200) {
        return jsonDecode(body);
        
      } else {
        throw HttpException('Failed to load posts: ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }
}
