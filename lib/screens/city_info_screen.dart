import 'package:flutter/material.dart';
import 'package:weather_app_flutter/models/weather_model.dart';

class CityInfoScreen extends StatelessWidget {
  const CityInfoScreen({super.key, required this.weatherModel});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: const Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // City name
            Text(
              weatherModel!.cityName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Country name
            Text(
              weatherModel!.countryName,
              style: const TextStyle(fontSize: 18),
            ),

            // Condition icon
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.network('http:${weatherModel?.currentIcon}'),
            ),

            // Condition text
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Text(
                    weatherModel!.condition,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${weatherModel!.temperature.toString()}°',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Hourly forecast list
            Container(
              margin: const EdgeInsets.all(10.0), // margin for the list
              decoration: BoxDecoration(
                color: const Color(0xfffafafb), // background
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
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 24,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 20,
                  indent: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0), // padding
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.zero, // reset default ListTile padding
                      leading: Image.network(
                          'http:${weatherModel?.hourlyIcons[index]}'),
                      title: Center(
                        child: Text(
                          "${weatherModel?.hourlyTemperatures[index]}°    ${weatherModel?.hourlyConditons[index]}",
                        ),
                      ),
                      trailing: Text(index < 10 ? "0$index:00" : "$index:00"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
