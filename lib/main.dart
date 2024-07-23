import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubits/get_cities_weather_cubit/cities_weather_cubit.dart';
import 'package:weather_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_app_flutter/screens/cities_screen.dart';
import 'package:weather_app_flutter/screens/daies_screen.dart';
import 'package:weather_app_flutter/screens/home_screen.dart';
import 'package:weather_app_flutter/screens/hours_screen.dart';
import 'package:weather_app_flutter/services/weather_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentCityWeatherCubit(WeatherService()),
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Tajawal',
            scaffoldBackgroundColor: const Color(0xffe5ecef)),
        initialRoute: '/home_screen',
        routes: {
          '/home_screen': (context) => const HomeScreen(),
          '/hours_screen': (context) => const HoursScreen(),
          '/daies_screen': (context) => const DaiesScreen(),
          '/cities_screen': (context) => BlocProvider(
                create: (context) => CitiesWeatherCubit(WeatherService()),
                child: const CitiesScreen(),
              ),
        },
      ),
    );
  }
}
