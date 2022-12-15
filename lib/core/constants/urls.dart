import 'package:weather_app/core/constants/secrets.dart';

class AppUrls {
  AppUrls._();

  static const String getWeatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=6.9271&lon=79.8612&appid=${AppSecrets.openWeatherApiKey}&units=metric';

  // static const String getWeatherUrl =
  //     'http://api.weatherapi.com/v1/current.json?key=${AppSecrets.openWeatherApiKey}&q=${AppSecrets.city}&aqi=no';
}
