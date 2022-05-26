import 'package:equatable/equatable.dart';

class HourlyWeatherData {
  const HourlyWeatherData({
    required this.hourlyTimestamp,
    required this.hourlyTemperature,
    required this.hourlyMainWeather,
    required this.hourlyWeatherDescription,
  });

  final num hourlyTimestamp;
  final num hourlyTemperature;
  final String hourlyMainWeather;
  final String hourlyWeatherDescription;
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

      hourlyWeatherDataList.add(HourlyWeatherData(
        hourlyTimestamp: hourlyTimestamp,
        hourlyTemperature: hourlyTemperature - 273.15,
        hourlyMainWeather: hourlyMainWeather,
        hourlyWeatherDescription: hourlyWeatherDescription,
      ));
    }

    return HourlyWeatherInfo(hourlyWeatherInfo: hourlyWeatherDataList);
  }

  @override
  List<Object?> get props => [hourlyWeatherInfo];
}
