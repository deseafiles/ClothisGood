import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:android/data/services/api/cloth/cloth_api_service.dart';

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });

  late ClothApiService clothApiService;

  setUp(() {
    clothApiService = ClothApiService();
  });

  test('getCloth returns a valid Cloth object', () async {
    final cloth = await clothApiService.getCloth('Outfit');

    expect(cloth.id, isNotEmpty);
    expect(cloth.urls.regular, startsWith('https://'));
    expect(cloth.user.username, isNotEmpty);
  });
}
