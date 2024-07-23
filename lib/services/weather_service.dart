import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = 'a558024a6e604438921154446242207';

  Future<WeatherModel> getWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        '$baseURL/forecast.json?key=$apiKey&q=$cityName&days=3&aqi=no&alerts=no'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<WeatherModel>> getCitiesWeather(List<String> citiesName) async {
    final weatherModels = await Future.wait(
      citiesName.map((cityName) => getWeather(cityName)),
    );
    return weatherModels;
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;
    return city ?? "";
  }

  Future<WeatherModel> getCurrentCityWeather() async {
    String cityName = await WeatherService().getCurrentCity();
    WeatherModel weatherModel = await WeatherService().getWeather(cityName);
    return weatherModel;
  }

  String getWeatherAnimation(String condition) {
    final animationMap = {
      'partly cloudy': 'partlyCloudy.json',
      'clear': 'clear.json',
      'mist': 'mist.json',
      'fog': 'mist.json',
      'rainny': 'rainny.json',
      'patchy light rain': 'rainny.json',
      'light rain': 'rainny.json',
      'moderate rain at times': 'rainny.json',
      'moderate rain': 'rainny.json',
      'patchy rain nearby': 'rainny.json',
      'heavy rain at times': 'rainny.json',
      'light freezing rain': 'rainny.json',
      'moderate or heavy freezing rain': 'rainny.json',
      'heavy rain': 'rainny.json',
      'light rain shower': 'rainny.json',
      'moderate or heavy rain in area with thunder': 'rainny.json',
      'moderate or heavy showers of ice pellets': 'rainny.json',
      'patchy light rain in area with thunder': 'rainny.json',
      'moderate or heavy rain shower': 'rainny.json',
      'torrential rain shower': 'rainny.json',
      'moderate or heavy sleet showers': 'rainny.json',
      'snow': 'snow.json',
      'light sleet': 'snow.json',
      'moderate snow': 'snow.json',
      'patchy heavy snow': 'snow.json',
      'moderate or heavy sleet': 'snow.json',
      'patchy light snow': 'snow.json',
      'light snow showers': 'snow.json',
      'heavy snow': 'snow.json',
      'ice pellets': 'snow.json',
      'light snow': 'snow.json',
      'moderate or heavy snow in area with thunder': 'snow.json',
      'patchy light snow in area with thunder': 'snow.json',
      'patchy moderate snow': 'snow.json',
      'blowing snow': 'snow.json',
      'light showers of ice pellets': 'snow.json',
      'moderate or heavy snow showers': 'snow.json',
      'blizzard': 'snow.json',
      'patchy snow nearby': 'snow.json',
      'patchy sleet nearby': 'snow.json',
      'patchy freezing drizzle nearby': 'snow.json',
      'storm': 'storm.json',
      'thundery outbreaks in nearby': 'storm.json',
      'sunny': 'sunny.json',
      'thunder': 'thunder.json',
      'windy': 'windy.json',
      'cloudy': 'windy.json',
      'overcast': 'windy.json',
    };

    return 'assets/lottie/${animationMap[condition.toLowerCase()] ?? 'no_weather.json'}';
  }
}
