class WeatherIcon {
  static Map<String, String> weatherIconsDay = {
    "Thunderstorm_Day": "assets/images/Sunny_Cloudy_Thunder_Rain.png",
    "Drizzle_Day": "assets/images/Sunny_Cloudy.png",
    "Rain_Day": "assets/images/Sunny_Cloudy_Rain.png",
    "Clear_Day": "assets/images/Sunny.png",
    // "Clouds_Day": "assets/images/Sunny_Cloudy.png",
    "Clouds_Day": "assets/images/Sunny.png",
    "Snow_Day": "assets/images/Snow.png",
    "Other_Day": "assets/images/Wind.png",
  };

  static Map<String, String> weatherIconsNight = {
    "Thunderstorm_Night": "assets/images/Moon_Cloudy_Thunder.png",
    "Drizzle_Night": "assets/images/Moon_Cloudy.png",
    "Rain_Night": "assets/images/Moon_Cloudy_Rain.png",
    "Clear_Night": "assets/images/Moon.png",
    // "Clouds_Night": "assets/images/Moon_Cloudy.png",
    "Clouds_Night": "assets/images/Moon.png",
    "Snow_Night": "assets/images/Snow.png",
    "Other_Night": "assets/images/Wind.png",
  };

  static String? getWeatherIcon(
      {required String mainWeather, required bool isDay}) {
    if (isDay) {
      return weatherIconsDay["${mainWeather}_Day"] ??
          weatherIconsDay["Other_Day"];
    } else {
      return weatherIconsNight["${mainWeather}_Night"] ??
          weatherIconsNight["Other_Night"];
    }
  }
}
