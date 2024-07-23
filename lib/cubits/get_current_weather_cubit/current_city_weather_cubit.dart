import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/services/weather_service.dart';

part 'current_city_weather_state.dart';

class CurrentCityWeatherCubit extends Cubit<CurrentCityWeatherState> {
  final WeatherService weatherService;
  WeatherModel? weatherModel;

  CurrentCityWeatherCubit(this.weatherService)
      : super(CurrentCityWeatherInitial());

  WeatherModel? getCurrentCityWeather() {
    weatherService.getCurrentCityWeather().then((weatherModel) {
      emit(CurrentCityWeatherLoaded(weatherModel));
      this.weatherModel = weatherModel;
    });
    return weatherModel;
  }
}
