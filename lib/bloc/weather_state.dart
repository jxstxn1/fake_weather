part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weather);
  final Weather weather;
  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {
  const WeatherError(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
