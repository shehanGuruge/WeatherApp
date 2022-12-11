import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather_mgt/presentation/pages/weather_details_display_page.dart';
import 'injection_container.dart' as dependancy_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dependancy_injection.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherDetailsDisplayPage(),
    );
  }
}
