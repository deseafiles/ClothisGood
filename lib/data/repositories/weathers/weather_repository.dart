import 'package:android/domain/models/weathers/weather.dart';
import 'package:android/utils/result.dart';

abstract class WeatherRepository {
 Future <Weather> getWeather(double lat, double long);

 // Future<Result<List<Weather>>> searchLocation(double lat, double long);
}
