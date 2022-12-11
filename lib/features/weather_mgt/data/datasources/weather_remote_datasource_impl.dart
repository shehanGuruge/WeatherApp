import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/urls.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/features/weather_mgt/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/features/weather_mgt/data/models/weather_model.dart';
import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';

class WeatherRemoteDatasourceImpl extends WeatherRemoteDatasource {
  @override
  Future<WeatherEntity> getCurrentWeather() async {
    try {
      final response = await Dio().get(AppUrls.getWeatherUrl);
      return WeatherModel.fromJSON(response.data);
    } on DioError catch (e) {
      if(e.response?.statusCode != null){
        throw NetworkException(e.response!.statusCode.toString());
      } else {
         throw NetworkException("400");
      }
    } catch (err) {
      throw NetworkException("400");
    }
  }
}
