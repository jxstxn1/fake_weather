import 'package:fake_weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/build_loading.dart';
import 'components/build_column_with_data.dart';
import 'components/build_initial_input.dart';

class WeatherSearchPage extends StatelessWidget {
  const WeatherSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Search"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return const BuildInitialInput();
              } else if (state is WeatherLoading) {
                return const BuildLoading();
              } else if (state is WeatherLoaded) {
                return BuildColumnWithData(weather: state.weather);
              } else if (state is WeatherError) {
                return const BuildInitialInput();
              } else {
                return const BuildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }
}
