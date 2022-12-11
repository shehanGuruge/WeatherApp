import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/services/net_info_service.dart';
import 'package:weather_app/features/weather_mgt/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/features/weather_mgt/data/datasources/weather_remote_datasource_impl.dart';
import 'package:weather_app/features/weather_mgt/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather_mgt/domain/repositories/weather_repostiory.dart';
import 'package:weather_app/features/weather_mgt/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/weather_mgt/presentation/providers/weather_provider.dart';

final sl = GetIt.instance;

void init() async {
  sl.registerLazySingleton<WeatherRemoteDatasource>(
    () => WeatherRemoteDatasourceImpl(),
  );

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositporyImpl(
      weatherRemoteDatasource: sl(),
      netInfoManager: sl(),
    ),
  );

  sl.registerFactory(
    () => GetWeatherUsecase(
      sl(),
    ),
  );

  sl.registerFactory(
    () => WeatherNotifier(
      sl(),
    ),
  );

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetInfoManager>(() => NetInfoManagerImpl(sl()));
}
