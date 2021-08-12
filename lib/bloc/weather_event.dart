part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  const GetWeather(this.cityName);

  final String cityName;

  @override
  List<Object?> get props => [cityName];
}

class GetDetailedWeather extends WeatherEvent {
  const GetDetailedWeather(this.cityName);

  final String cityName;

  @override
  List<Object?> get props => [cityName];
}
