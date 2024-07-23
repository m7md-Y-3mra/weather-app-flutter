import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_app_flutter/models/weather_model.dart';

class HoursScreen extends StatefulWidget {
  const HoursScreen({super.key});

  @override
  State<HoursScreen> createState() => _HoursScreenState();
}

class _HoursScreenState extends State<HoursScreen> {
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
          'Hourly Forecast',
          style: TextStyle(color: Colors.white),
        ),
      ),

      // body of hourly screen
      body: ListView.separated(
        itemCount: 24,
        separatorBuilder: (context, index) => const Divider(
          height: 20,
          thickness: 1,
          color: Colors.grey,
          endIndent: 20,
          indent: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10.0), // margin
            decoration: BoxDecoration(
              color: Colors.white, // background
              borderRadius: BorderRadius.circular(10.0), // border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // shadow color
                  offset: const Offset(0, 4), // shadow offset
                  blurRadius: 6.0, // shadow blur radius
                  spreadRadius: -1.0, // shadow spread radius
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // shadow color
                  offset: const Offset(0, 2), // shadow offset
                  blurRadius: 4.0, // shadow blur radius
                  spreadRadius: -2.0, // shadow spread radius
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 10.0), // padding
            child: Column(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.zero, // reset default ListTile padding
                  leading: Image(
                      image: NetworkImage(
                          'http:${currentCityWeather?.hourlyIcons[index]}')),
                  title: Center(
                    child: Text(
                      "${currentCityWeather?.hourlyTemperatures[index]}°    ${currentCityWeather?.hourlyConditons[index]}",
                    ),
                  ),
                  trailing: Text(index < 10 ? "0$index:00" : "$index:00"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
