import 'package:fake_weather/bloc/weather_bloc.dart';
import 'package:fake_weather/pages/components/build_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/weather.dart';
import 'components/build_column_with_detailed_data.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({
    required this.masterWeather,
  });

  final Weather masterWeather;

  @override
  _WeatherDetailPageState createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<WeatherBloc>(context)
        .add(GetDetailedWeather(widget.masterWeather.cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Detail"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const BuildLoading();
            } else if (state is WeatherLoaded) {
              return BuildColumnWithDetailedData(weather: state.weather);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
