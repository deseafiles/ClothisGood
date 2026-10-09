import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/utils/result.dart';

abstract class WeatherRepository {
 Future<Result<List<Weather>>> getWeather(double lat, double long);
}
