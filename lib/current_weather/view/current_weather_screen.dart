import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

import '../widgets/hourly_data.dart';
import '../widgets/weather_details.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherStateInitial) {
          BlocProvider.of<WeatherBloc>(context).add(const FetchWeather());
        }

        if (state is FetchingWeatherError) {
          return const Center(
            child: Text(
              'Something went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          );
        }

        if (state is FetchingWeatherDone) {
          return Column(
            children: [
              Expanded(
                flex: 7,
                child: WeatherDetails(
                  size: size,
                  weatherDetails: state.weather.weatherInfo,
                ),
              ),
              Expanded(
                flex: 2,
                child: HourlyData(
                  hourlyWeatherDetails: state.weather.hourlyWeatherInfo,
                ),
              ),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
