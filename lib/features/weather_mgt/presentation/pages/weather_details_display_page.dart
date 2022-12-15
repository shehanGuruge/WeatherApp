import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/secrets.dart';
import 'package:weather_app/features/weather_mgt/presentation/providers/weather_provider.dart';

class WeatherDetailsDisplayPage extends StatelessWidget {
  const WeatherDetailsDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
      ),
      floatingActionButton: Consumer(builder: (context, ref, child) {
        return IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(weatherProvider.notifier).getWeatherForColombo();
          },
        );
      }),
      body: Column(
        children: [
          Consumer(builder: (context, ref, _) {
            final state = ref.watch(weatherProvider);
            return Expanded(
              child: state.when(
                data: (data) {
                  return Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppSecrets.city,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          data?.weatherType != null
                              ? data!.weatherType.toUpperCase()
                              : "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          data?.weatherDescription != null
                              ? data!.weatherDescription
                              : "",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "${data?.temp != null ? data!.temp : 0} \u2103",
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Min: ${data?.tempMin != null ? data!.tempMin : 0} \u2103",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              " / Max: ${data?.tempMax != null ? data!.tempMax : 0} \u2103",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                error: (error, _) => Center(
                  child: Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
