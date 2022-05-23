import 'package:equatable/equatable.dart';

import './models.dart';

class HourlyWeatherInfo extends Equatable {
  const HourlyWeatherInfo({required this.hourlyWeather});

  final List<WeatherInfo> hourlyWeather;

  @override
  List<Object?> get props => [hourlyWeather];
}
