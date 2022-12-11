import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  String region;
  String country;

  double temp_c;
  double temp_f;

  WeatherEntity(
      {required this.region,
      required this.country,
      required this.temp_c,
      required this.temp_f});

  @override
  List<Object?> get props => [region, country, temp_c, temp_f];
}
