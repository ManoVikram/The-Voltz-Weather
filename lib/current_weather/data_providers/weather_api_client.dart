import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data_providers/device_location_client.dart';
import '../repositories/location_repository.dart';
import '../models/models.dart';

import '../../secrets.dart';

class WeatherAPIClient {
  final http.Client httpClient;

  WeatherAPIClient({
    required this.httpClient,
  });

  final LocationRepository locationRepository =
      LocationRepository(deviceLocationClient: DeviceLocationClient());

  Future<Weather> fetchWeather() async {
    final DeviceLocation location = await locationRepository.fetchLocation();

    late final String _apiURL =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$openWeatherAPIKey";

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
      locationName: location.area,
    );
  }
}
