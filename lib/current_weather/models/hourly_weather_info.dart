import 'package:equatable/equatable.dart';

import './weather_icon.dart';

class HourlyWeatherData {
  const HourlyWeatherData({
    required this.hourlyTimestamp,
    required this.hourlyTemperature,
    required this.hourlyMainWeather,
    required this.hourlyWeatherDescription,
    required this.weatherIcon,
  });

  final DateTime hourlyTimestamp;
  final num hourlyTemperature;
  final String hourlyMainWeather;
  final String hourlyWeatherDescription;
  final String weatherIcon;
}

class HourlyWeatherInfo extends Equatable {
  const HourlyWeatherInfo({required this.hourlyWeatherInfo});

  final List<HourlyWeatherData> hourlyWeatherInfo;

  factory HourlyWeatherInfo.fromJson(List<dynamic> data) {
    List<HourlyWeatherData> hourlyWeatherDataList = [];

    for (var hourlyData in data) {
      final hourlyTimestamp = hourlyData["dt"] as num;
      final hourlyTemperature = hourlyData["temp"] as num;
      final hourlyMainWeather = hourlyData["weather"][0]["main"] as String;
      final hourlyWeatherDescription =
          hourlyData["weather"][0]["description"] as String;

      final DateTime time =
          DateTime.fromMillisecondsSinceEpoch(hourlyTimestamp.toInt() * 1000);

      bool isDay = true;

      if (!(time.hour > 6 && time.hour < 18)) {
        isDay = false;
      }

      if (DateTime.now().day == time.day) {
        hourlyWeatherDataList.add(HourlyWeatherData(
          hourlyTimestamp: DateTime.fromMillisecondsSinceEpoch(
              hourlyTimestamp.toInt() * 1000),
          hourlyTemperature: hourlyTemperature - 273.15,
          hourlyMainWeather: hourlyMainWeather,
          hourlyWeatherDescription: hourlyWeatherDescription,
          weatherIcon: WeatherIcon.getWeatherIcon(
            mainWeather: hourlyMainWeather,
            isDay: isDay,
          )!,
        ));
      }
    }

    return HourlyWeatherInfo(hourlyWeatherInfo: hourlyWeatherDataList);
  }

  @override
  List<Object?> get props => [hourlyWeatherInfo];
}
