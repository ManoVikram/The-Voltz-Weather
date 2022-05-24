import '../data_providers/weather_api_client.dart';

import '../models/models.dart';

class WeatherRepository {
  const WeatherRepository({required this.weatherAPIClient});

  final WeatherAPIClient weatherAPIClient;

  Future<Weather> fetchWeather() async {
    return await weatherAPIClient.fetchWeather();
  }
}
