import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/services/net_info_service.dart';
import 'package:weather_app/features/weather_mgt/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather_mgt/domain/repositories/weather_repostiory.dart';

class WeatherRepositporyImpl extends WeatherRepository {
  final WeatherRemoteDatasource weatherRemoteDatasource;
  final NetInfoManager netInfoManager;

  WeatherRepositporyImpl(
      {required this.weatherRemoteDatasource, required this.netInfoManager});

  @override
  Future<Either<Failure, WeatherEntity>> queryCurrentWeather() async {
    if (await netInfoManager.isConnected) {
      try {
        final response = await weatherRemoteDatasource.getCurrentWeather();
        return Right(response);
      } on NetworkException catch (e) {
        if (e.code == "401") {
          return const Left(
            NetworkFailure(
              "Not authorized to send the request. Please contact support on this query.",
            ),
          );
        } else if (e.code == "404") {
          return const Left(
            NetworkFailure(
              "Service has been down or interrupted. Please try again later.",
            ),
          );
        } else {
          return const Left(
            NetworkFailure(
              "An error occured while processing your request. Please try again later.",
            ),
          );
        }
      }
    } else {
      return const Left(
        NetworkFailure(
          "Please make sure you are connected to a stable network connection and try again.",
        ),
      );
    }
  }
}
