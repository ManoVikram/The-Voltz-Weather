import 'package:equatable/equatable.dart';

import './models.dart';

class Weather extends Equatable {
  const Weather({
    required this.weatherInfo,
    required this.hourlyWeatherInfo,
    required this.locationName,
  });

  final WeatherInfo weatherInfo;
  final HourlyWeatherInfo hourlyWeatherInfo;
  final String locationName;

  @override
  List<Object?> get props => [
        weatherInfo,
        hourlyWeatherInfo,
      ];
}
