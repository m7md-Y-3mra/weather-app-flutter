part of 'cities_weather_cubit.dart';

@immutable
sealed class CitiesWeatherState {}

final class CitiesWeatherInitial extends CitiesWeatherState {}

final class CitiesWeatherLoaded extends CitiesWeatherState {
  final List<WeatherModel> weatherModels;

  CitiesWeatherLoaded(this.weatherModels);
}
