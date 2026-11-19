import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:android/domain/models/weathers/current_weather.dart';

class OutfitService {
  final OutfitRepository repository;

  OutfitService(this.repository);

  Future<ClothPage> getClothWithWeather(
    String category,
    CurrentWeather weather, {
        int page = 1,
      }) async {
          print('MASUK KE CONTROLLER');
          
          int key = weather.weatherCode;

          String keyword = '';

          switch (key) {
            case 0:
            case 1: {
              if (weather.apparentTemperature < 18) {
                keyword = 'sweater cold weather outfit';
              } else if (weather.apparentTemperature <= 23) {
                keyword = 'cardigan sunny day outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'casual sunny day outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight summer outfit';
              } else {
                keyword = 'breathable loose summer outfit';
              }
              break;
            }

            case 2: {
              if (weather.apparentTemperature < 24) {
                keyword = 'casual layered outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'casual everyday outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight casual outfit';
              } else {
                keyword = 'loose breathable summer outfit';
              }
              break;
            }

            case 3: {
              if (weather.apparentTemperature < 24) {
                keyword = 'sweater casual outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'casual cloudy day outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight casual outfit';
              } else {
                keyword = 'breathable loose clothing outfit';
              }
              break;
            }

            case 45:
            case 48: {
              if (weather.apparentTemperature < 18) {
                keyword = 'warm jacket layered outfit';
              } else if (weather.apparentTemperature <= 23) {
                keyword = 'sweater casual outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'light cardigan casual outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight long sleeve outfit';
              } else {
                keyword = 'breathable casual outfit';
              }
              break;
            }

            case 51:
            case 53:
            case 55: {
              if (weather.apparentTemperature < 18) {
                keyword = 'warm rain jacket outfit';
              } else if (weather.apparentTemperature <= 23) {
                keyword = 'rainy day hoodie outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'casual rainy day outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight rain jacket outfit';
              } else {
                keyword = 'breathable rain jacket outfit';
              }
              break;
            }

            case 56:
            case 57: {
              keyword = 'insulated waterproof jacket outfit';
              break;
            }

            case 61:
            case 63:
            case 65: {
              if (weather.apparentTemperature < 18) {
                keyword = 'warm waterproof jacket outfit';
              } else if (weather.apparentTemperature <= 23) {
                keyword = 'rainy day hoodie outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'casual rain jacket outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight waterproof jacket outfit';
              } else {
                keyword = 'breathable waterproof clothing outfit';
              }
              break;
            }

            case 66:
            case 67: {
              keyword = 'insulated waterproof coat outfit';
              break;
            }

            case 71:
            case 73:
            case 75:
            case 77: {
              if (weather.apparentTemperature < 18) {
                keyword = 'winter coat sweater outfit';
              } else if (weather.apparentTemperature <= 23) {
                keyword = 'warm layered clothing outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'light jacket layered outfit';
              } else {
                keyword = 'casual lightweight outfit';
              }
              break;
            }

            case 80:
            case 81: {
              if (weather.apparentTemperature < 24) {
                keyword = 'casual rain jacket outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'lightweight rainy day outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight waterproof jacket outfit';
              } else {
                keyword = 'breathable rain jacket outfit';
              }
              break;
            }

            case 82: {
              keyword = 'waterproof raincoat outfit';
              break;
            }

            case 85:
            case 86: {
              keyword = 'winter waterproof jacket outfit';
              break;
            }

            case 95: {
              if (weather.apparentTemperature < 24) {
                keyword = 'warm waterproof jacket outfit';
              } else if (weather.apparentTemperature <= 29) {
                keyword = 'casual rain jacket outfit';
              } else if (weather.apparentTemperature <= 34) {
                keyword = 'lightweight rain jacket outfit';
              } else {
                keyword = 'breathable waterproof jacket outfit';
              }
              break;
            }

            case 96:
            case 97:
            case 99: {
              keyword = 'waterproof protective jacket outfit';
              break;
            }

            default: {
              keyword = 'casual everyday outfit';
              break;
            }
          }

          print('Controller Category: $category');

          final searchCategory = '$category $keyword';

          final cloth = await repository.getCloth(
            searchCategory, 
            weather,
            page: page);

          return cloth;
    }

  Future<Cloth> getClothById(String id) async {
      final cloth = await repository.getClothById(id);
      return cloth;
    }

  Future<ClothPage> searchCloth(String category, {
      int page = 1,
    }) async {
        final cloth = await repository.searchOutfit(
          category,
          page: page,
          );

        return cloth;
      }
}
