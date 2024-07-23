import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/services/weather_service.dart';

part 'cities_weather_state.dart';

class CitiesWeatherCubit extends Cubit<CitiesWeatherState> {
  final WeatherService weatherService;
  List<WeatherModel>? weatherModels;

  CitiesWeatherCubit(this.weatherService) : super(CitiesWeatherInitial());

  List<WeatherModel>? getCitiesWeather(List<String> citiesName) {
    weatherService.getCitiesWeather(citiesName).then((weatherModels) {
      emit(CitiesWeatherLoaded(weatherModels));
      this.weatherModels = weatherModels;
    });
    return weatherModels;
  }
}
