import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubits/get_current_weather_cubit/current_city_weather_cubit.dart';
import 'package:weather_app_flutter/models/weather_model.dart';

class DaiesScreen extends StatefulWidget {
  const DaiesScreen({super.key});

  @override
  State<DaiesScreen> createState() => _DaiesScreenState();
}

class _DaiesScreenState extends State<DaiesScreen> {
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
          'Daily Forecast',
          style: TextStyle(color: Colors.white),
        ),
      ),

      // body of daies screen
      body: ListView.separated(
        itemCount: 3,
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
                          'http:${currentCityWeather?.dailyIcons[index]}')),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // conditon text
                      Text(
                        '${currentCityWeather?.dailyConditons[index]}',
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      // max tempreture
                      const Icon(Icons.keyboard_arrow_up_sharp),
                      Text(
                        '${currentCityWeather?.dailyMaxTemperatures[index]}°',
                      ),

                      // min temperture
                      const Icon(Icons.keyboard_arrow_down_sharp),
                      Text(
                        '${currentCityWeather?.dailyMinTemperatures[index]}°',
                      ),
                    ],
                  ),

                  // date
                  trailing:
                      Text(currentCityWeather!.dailyDate[index].toString()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
