import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
    this.temperatureFahrenheit = 0.0,
  });

  final String cityName;
  final double temperatureCelsius;
  final double temperatureFahrenheit;

  @override
  List<Object?> get props => [
        cityName,
        temperatureCelsius,
        temperatureFahrenheit,
      ];
}
