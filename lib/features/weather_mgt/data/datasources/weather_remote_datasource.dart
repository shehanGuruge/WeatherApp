import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherEntity> getCurrentWeather();
}
