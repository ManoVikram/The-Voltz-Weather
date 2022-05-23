import 'package:equatable/equatable.dart';

class WeatherInfo extends Equatable {
  const WeatherInfo({
    required this.temperature,
    required this.timestamp,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.uvi,
    required this.mainWeather,
    required this.weatherDescription,
  });

  final int temperature;
  final int timestamp;
  final int wind;
  final int humidity;
  final int pressure;
  final double uvi;
  final String mainWeather;
  final String weatherDescription;

  @override
  List<Object?> get props => [
        temperature,
        timestamp,
        wind,
        humidity,
        pressure,
        uvi,
        mainWeather,
        weatherDescription,
      ];
}
