import 'package:equatable/equatable.dart';

import './models.dart';

class Weather extends Equatable {
  const Weather({
    required this.weatherInfo,
    required this.hourlyWeatherInfo,
  });

  final WeatherInfo weatherInfo;
  final HourlyWeatherInfo hourlyWeatherInfo;

  @override
  List<Object?> get props => [
        weatherInfo,
        hourlyWeatherInfo,
      ];
}
