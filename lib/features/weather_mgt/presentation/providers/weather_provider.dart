import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/utils/usecase.dart';
import 'package:weather_app/features/weather_mgt/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather_mgt/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/injection_container.dart';

final weatherProvider = StateNotifierProvider.autoDispose<WeatherNotifier,
    AsyncValue<WeatherEntity?>>((ref) => sl<WeatherNotifier>());

class WeatherNotifier extends StateNotifier<AsyncValue<WeatherEntity?>> {
  final GetWeatherUsecase getWeatherUsecase;

  WeatherNotifier(this.getWeatherUsecase) : super(const AsyncValue.data(null)) {
    getWeatherForColombo();
  }

  Future<void> getWeatherForColombo() async {
    state = const AsyncValue.loading();

    final response = await getWeatherUsecase(NoParams());
    response.fold((l) {
      state = AsyncValue.error(l.message, StackTrace.fromString(l.message));
    }, (r) {
      state = AsyncValue.data(r);
    });
  }
}
