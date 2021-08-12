import 'package:fake_weather/bloc/weather_bloc.dart';
import 'package:fake_weather/data/model/weather.dart';
import 'package:fake_weather/pages/weather_detail_page/weather_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'city_input_field.dart';

class BuildColumnWithData extends StatelessWidget {
  const BuildColumnWithData({required this.weather, Key? key})
      : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: const TextStyle(fontSize: 80),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<WeatherBloc>(context),
                child: WeatherDetailPage(
                  masterWeather: weather,
                ),
              ),
            ));
          },
          child: const Text('See Details'),
        ),
        CityInputField(),
      ],
    );
  }
}
