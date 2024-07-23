class WeatherModel {
  final String cityName;
  final String countryName;
  final double temperature;
  final String condition;
  final String currentIcon;
  final List<double> hourlyTemperatures;
  final List<String> hourlyIcons;
  final List<String> hourlyConditons;
  final List<String> dailyConditons;
  final List<String> dailyIcons;
  final List<double> dailyMaxTemperatures;
  final List<double> dailyMinTemperatures;
  final List<String> dailyDate;
  final double windSpeed;
  final double feelsLike;
  final double precip;
  final double uv;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.temperature,
    required this.condition,
    required this.currentIcon,
    required this.hourlyTemperatures,
    required this.hourlyIcons,
    required this.hourlyConditons,
    required this.dailyConditons,
    required this.dailyMaxTemperatures,
    required this.dailyMinTemperatures,
    required this.dailyDate,
    required this.dailyIcons,
    required this.windSpeed,
    required this.feelsLike,
    required this.precip,
    required this.uv,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final forecast = json['forecast']['forecastday'];

    List<double> extractTemperatures(String key) {
      return List<double>.generate(
        24,
        (index) => forecast[0]['hour'][index]['temp_c'],
      );
    }

    List<String> extractIcons(String key) {
      return List<String>.generate(
        24,
        (index) => forecast[0]['hour'][index]['condition']['icon'],
      );
    }

    List<String> extractConditions(String key) {
      return List<String>.generate(
        24,
        (index) => forecast[0]['hour'][index]['condition']['text'],
      );
    }

    List<double> extractDailyTemperatures(String key) {
      return List<double>.generate(
        3,
        (index) => forecast[index]['day'][key],
      );
    }

    List<String> extractDailyIcons(String key) {
      return List<String>.generate(
        3,
        (index) => forecast[index]['day']['condition'][key],
      );
    }

    List<String> extractDates(String key) {
      return List<String>.generate(
        3,
        (index) => forecast[index][key],
      );
    }

    return WeatherModel(
      cityName: json['location']['name'],
      countryName: json['location']['country'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      windSpeed: json['current']['wind_kph'],
      currentIcon: json['current']['condition']['icon'],
      feelsLike: json['current']['feelslike_c'],
      precip: json['current']['precip_mm'],
      uv: json['current']['uv'],
      hourlyTemperatures: extractTemperatures('temp_c'),
      hourlyIcons: extractIcons('icon'),
      hourlyConditons: extractConditions('text'),
      dailyConditons: extractDailyIcons('text'),
      dailyIcons: extractDailyIcons('icon'),
      dailyMaxTemperatures: extractDailyTemperatures('maxtemp_c'),
      dailyMinTemperatures: extractDailyTemperatures('mintemp_c'),
      dailyDate: extractDates('date'),
    );
  }
}
