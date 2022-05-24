import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './constants.dart';

import './current_weather/view/current_weather_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Open Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const WeatherApp(),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurrentWeatherScreen(),
    );
  }
}

void main(List<String> args) {
  runApp(const MyApp());
}

// Check this site for more details on the app architecture
// - https://medium.com/flutter-community/flutter-essential-what-you-need-to-know-567ad25dcd8f