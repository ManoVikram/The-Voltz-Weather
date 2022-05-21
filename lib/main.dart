import 'package:flutter/material.dart';

import './constants.dart';

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
      debugShowMaterialGrid: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: backgroundColor,
      ),
      home: const WeatherApp(),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

void main(List<String> args) {
  runApp(const MyApp());
}
