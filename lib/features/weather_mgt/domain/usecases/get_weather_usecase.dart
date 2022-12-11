import 'package:weather_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/utils/usecase.dart';
import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather_mgt/domain/repositories/weather_repostiory.dart';

class GetWeatherUsecase extends UseCase<WeatherEntity, NoParams> {
  final WeatherRepository weatherRepository;

  GetWeatherUsecase(this.weatherRepository);

  @override
  Future<Either<Failure, WeatherEntity>> call(NoParams params) {
    return weatherRepository.queryCurrentWeather();
  }
}
