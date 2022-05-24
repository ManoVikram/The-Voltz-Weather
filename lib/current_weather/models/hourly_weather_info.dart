import 'package:equatable/equatable.dart';

class HourlyWeatherInfo extends Equatable {
  const HourlyWeatherInfo({
    required this.hourlyTimestamp,
    required this.hourlyTemperature,
    required this.hourlyMainWeather,
    required this.hourlyWeatherDescription,
  });

  final int hourlyTimestamp;
  final int hourlyTemperature;
  final String hourlyMainWeather;
  final String hourlyWeatherDescription;

  factory HourlyWeatherInfo.fromJson(Map<String, dynamic> data) {
    final hourlyTimestamp = data["dt"] as int;
    final hourlyTemperature = data["temp"] as int;
    final hourlyMainWeather = data["weather"]["main"] as String;
    final hourlyWeatherDescription = data["weather"]["description"] as String;

    return HourlyWeatherInfo(
      hourlyTimestamp: hourlyTimestamp,
      hourlyTemperature: hourlyTemperature,
      hourlyMainWeather: hourlyMainWeather,
      hourlyWeatherDescription: hourlyWeatherDescription,
    );
  }

  @override
  List<Object?> get props => [
        hourlyTimestamp,
        hourlyTemperature,
        hourlyMainWeather,
        hourlyWeatherDescription,
      ];
}
