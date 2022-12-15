import 'dart:ffi';

import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';

// ignore: must_be_immutable
class WeatherModel extends WeatherEntity {
  WeatherModel(
      {required String region,
      required String country,
      required double temp,
      required double tempMax,
      required double tempMin,
      required String weatherType,
      required String weatherDescription})
      : super(
            region: region,
            country: country,
            temp: temp,
            tempMax: tempMax,
            tempMin: tempMin,
            weatherDescription: weatherDescription,
            weatherType: weatherType);

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
      region: json['name'],
      country: json['sys']['country'],
      temp: json['main']['temp'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
      weatherDescription:
          json['weather'] != null ? json['weather'][0]['description'] : "",
      weatherType: json['weather'] != null ? json['weather'][0]['main'] : "",
    );
  }
}
