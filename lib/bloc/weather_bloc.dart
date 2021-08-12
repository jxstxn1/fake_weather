import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_weather/data/core/errors.dart';
import 'package:fake_weather/data/model/weather.dart';
import 'package:fake_weather/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.repository) : super(const WeatherInitial());
  final WeatherRepository repository;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield const WeatherLoading();
    if (event is GetWeather) {
      try {
        final weather = await repository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield const WeatherError(
            "Couldn't fetch weather. Is the device online?");
      }
    } else if (event is GetDetailedWeather) {
      try {
        final weather = await repository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield const WeatherError(
            "Couldn't fetch weather. Is the device online?");
      }
    }
  }
}
