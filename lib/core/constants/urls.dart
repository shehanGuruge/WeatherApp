import 'package:weather_app/core/constants/secrets.dart';

class AppUrls {
  AppUrls._();

  // static const String getWeatherUrl =
  //     'https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.0&appid=${AppSecrets.openWeatherApiKey}';

  static const String getWeatherUrl =
      'http://api.weatherapi.com/v1/current.json?key=${AppSecrets.openWeatherApiKey}&q=${AppSecrets.city}&aqi=no';
}
