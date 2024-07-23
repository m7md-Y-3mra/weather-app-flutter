import 'package:flutter/material.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/screens/city_info_screen.dart';

class CitiesWeatherWidget extends StatelessWidget {
  const CitiesWeatherWidget({
    super.key,
    required this.weatherModels,
  });

  final List<WeatherModel>? weatherModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: const Text(
          'Cities Forecast',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: weatherModels!.length,
        separatorBuilder: (context, index) => const Divider(
          height: 20,
          thickness: 1,
          color: Colors.grey,
          endIndent: 20,
          indent: 20,
        ),
        itemBuilder: (context, index) {
          final weatherModel = weatherModels![index];
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
            child: ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CityInfoScreen(weatherModel: weatherModel),
                ),
              ),
              contentPadding: EdgeInsets.zero, // reset default ListTile padding
              leading: Image.network('http:${weatherModel.currentIcon}'),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // condition text
                  Text(
                    weatherModel.condition,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  // temperature text
                  Text(
                    '${weatherModel.temperature}°',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Text(
                weatherModel.cityName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
