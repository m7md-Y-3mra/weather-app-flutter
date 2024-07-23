part of 'current_city_weather_cubit.dart';

@immutable
sealed class CurrentCityWeatherState {}

final class CurrentCityWeatherInitial extends CurrentCityWeatherState {}

final class CurrentCityWeatherLoaded extends CurrentCityWeatherState {
  final WeatherModel weatherModel;

  CurrentCityWeatherLoaded(this.weatherModel);
}
