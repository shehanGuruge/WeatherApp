import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  String region;
  String country;

  double temp;
  double tempMax;
  double tempMin;

  String weatherType;
  String weatherDescription;

  WeatherEntity(
      {required this.region,
      required this.country,
      required this.temp,
      required this.tempMax,
      required this.tempMin,
      required this.weatherDescription,
      required this.weatherType});

  @override
  List<Object?> get props => [region, country, temp, tempMin, tempMax, weatherType, weatherDescription];
}
