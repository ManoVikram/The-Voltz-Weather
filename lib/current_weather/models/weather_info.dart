import 'package:equatable/equatable.dart';

import './weather_icon.dart';

class WeatherInfo extends Equatable {
  const WeatherInfo({
    required this.temperature,
    required this.feelsLikeTemperature,
    required this.timestamp,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.uvi,
    required this.mainWeather,
    required this.weatherDescription,
    required this.weatherIcon,
  });

  final num temperature;
  final num feelsLikeTemperature;
  final DateTime timestamp;
  final num wind;
  final num humidity;
  final num pressure;
  final num uvi;
  final String mainWeather;
  final String weatherDescription;
  final String weatherIcon;

  factory WeatherInfo.fromJson(Map<String, dynamic> data) {
    final temperature =
        data["temp"] as num; // In Kelvin - should be converted to Celcius
    final feelsLikeTemperature =
        data["feels_like"] as num; // In Kelvin - should be converted to Celcius
    final timestamp = data["dt"] as num; // UTC - Epoch
    final wind = data["wind_speed"] as num; // m/s
    final humidity = data["humidity"] as num; // %
    final pressure = data["pressure"] as num; // hPa
    final uvi = data["uvi"] as num; // UV Index
    var mainWeather = data["weather"][0]["main"] as String;
    final weatherDescription = data["weather"][0]["description"] as String;

    final DateTime time =
        DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000);

    bool isDay = true;

    if (!(time.hour > 6 && time.hour < 18)) {
      isDay = false;
    }

    /* if (mainWeather == "Clouds") {
      if (isDay) {
        mainWeather = "Clear";
      } else {
        mainWeather = "Clear";
      }
    } */

    return WeatherInfo(
      temperature: temperature - 273.15,
      feelsLikeTemperature: feelsLikeTemperature - 273.15,
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000),
      wind: wind,
      humidity: humidity,
      pressure: pressure,
      uvi: uvi,
      mainWeather: mainWeather,
      weatherDescription: weatherDescription,
      weatherIcon: WeatherIcon.getWeatherIcon(
        mainWeather: mainWeather,
        isDay: isDay,
      )!,
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
