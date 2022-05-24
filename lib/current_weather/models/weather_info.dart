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

  factory WeatherInfo.fromJson(Map<String, dynamic> data) {
    final temperature =
        data["temp"] as int; // In Kelvin - should be converted to Celcius
    final timestamp = data["dt"] as int; // UTC - Epoch
    final wind = data["wind_speed"] as int; // m/s
    final humidity = data["humidity"] as int; // %
    final pressure = data["pressure"] as int; // hPa
    final uvi = data["uvi"] as double; // UV Index
    final mainWeather = data["weather"]["main"] as String;
    final weatherDescription = data["weather"]["description"] as String;

    return WeatherInfo(
      temperature: temperature,
      timestamp: timestamp,
      wind: wind,
      humidity: humidity,
      pressure: pressure,
      uvi: uvi,
      mainWeather: mainWeather,
      weatherDescription: weatherDescription,
    );
  }

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
