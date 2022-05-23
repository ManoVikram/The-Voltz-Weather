import 'package:flutter/material.dart';

import '../widgets/hourly_data.dart';
import '../widgets/weather_details.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: WeatherDetails(size: size),
          ),
          const Expanded(
            flex: 2,
            child: HourlyData(),
          ),
        ],
      ),
    );
  }
}




