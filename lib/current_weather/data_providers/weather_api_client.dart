import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class WeatherAPIClient {
  // It's better to have the API ID in a secret place and
  // fetch the latitude and longitude from the geolocator package
  final _apiURL =
      "https://api.openweathermap.org/data/2.5/onecall?lat=12.9165&lon=79.1325&appid=c936909e91c940e7873f7c6c47d5f7a8";
  final http.Client httpClient;

  const WeatherAPIClient({required this.httpClient});

  Future<Weather> fetchWeather() async {
    final uri = Uri.parse(_apiURL);
    final response = await httpClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Error getting weather from API!");
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    final WeatherInfo currentWeatherInfo =
        WeatherInfo.fromJson(json["current"]);
    final HourlyWeatherInfo hourlyWeatherInfo =
        HourlyWeatherInfo.fromJson(json["hourly"]);

    return Weather(
      weatherInfo: currentWeatherInfo,
      hourlyWeatherInfo: hourlyWeatherInfo,
    );
  }
}
