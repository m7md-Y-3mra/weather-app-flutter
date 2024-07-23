import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/widgets/city_weather_widget.dart';
import 'package:weather_app_flutter/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? currentCityWeather;

  @override
  void initState() {
    super.initState();
    currentCityWeather = BlocProvider.of<CurrentCityWeatherCubit>(context)
        .getCurrentCityWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      // drawer
      drawer: const DrawerWidget(),

      // body
      body: BlocBuilder<CurrentCityWeatherCubit, CurrentCityWeatherState>(
        builder: (context, state) {
          if (state is CurrentCityWeatherLoaded) {
            currentCityWeather = state.weatherModel;
            return CityWeatherWidget(weatherModel: currentCityWeather);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
