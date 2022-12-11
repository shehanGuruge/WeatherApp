import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';

// ignore: must_be_immutable
class WeatherModel extends WeatherEntity {
  WeatherModel(
      {required String region,
      required String country,
      required double temp_c,
      required double temp_f})
      : super(region: region, country: country, temp_c: temp_c, temp_f: temp_f);

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
      region: json['location']['region'],
      country: json['location']['country'],
      temp_c: json['current']['temp_c'],
      temp_f: json['current']['temp_f'],
    );
  }
}
