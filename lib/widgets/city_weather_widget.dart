import 'package:flutter/material.dart';
import 'package:weather_app_flutter/models/weather_model.dart';

class CityWeatherWidget extends StatelessWidget {
  const CityWeatherWidget({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // current location (city)
          Text(
            weatherModel!.cityName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // current location (city)
          Text(
            weatherModel!.countryName,
            style: const TextStyle(fontSize: 18),
          ),

          // current condition icon
          Image(image: NetworkImage('http:${weatherModel?.currentIcon}')),

          // current condition text
          Text(
            weatherModel!.condition,
            style: const TextStyle(fontSize: 18),
          ),
          // current tempreature

          Text(
            '${weatherModel!.temperature.toString()}°',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
