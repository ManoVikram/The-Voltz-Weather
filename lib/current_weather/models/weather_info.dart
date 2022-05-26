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

  final num temperature;
  final num timestamp;
  final num wind;
  final num humidity;
  final num pressure;
  final num uvi;
  final String mainWeather;
  final String weatherDescription;

  factory WeatherInfo.fromJson(Map<String, dynamic> data) {
    final temperature =
        data["temp"] as num; // In Kelvin - should be converted to Celcius
    final timestamp = data["dt"] as num; // UTC - Epoch
    final wind = data["wind_speed"] as num; // m/s
    final humidity = data["humidity"] as num; // %
    final pressure = data["pressure"] as num; // hPa
    final uvi = data["uvi"] as num; // UV Index
    final mainWeather = data["weather"][0]["main"] as String;
    final weatherDescription = data["weather"][0]["description"] as String;

    return WeatherInfo(
      temperature: temperature - 273.15,
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
