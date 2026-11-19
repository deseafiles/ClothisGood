import 'package:android/domain/models/weathers/weather.dart';

abstract class WeatherRepository {
 Future <Weather> getWeather(double lat, double long);
}
