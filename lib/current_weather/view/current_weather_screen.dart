import 'package:flutter/material.dart';
import 'package:open_weather_app/constants.dart';

import '../widgets/weather_details.dart';
import '../widgets/temperature_text.dart';

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

class HourlyData extends StatelessWidget {
  const HourlyData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
        horizontal: defaultPadding * 2,
      ),
      child: Column(
        children: [
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "7 days",
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next_outlined,
                    color: Colors.white60,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HourlyDataDetails(
                  temperature: 13,
                  image: "assets/images/Cloudy.png",
                  time: "10:00",
                ),
                HourlyDataDetails(
                  temperature: 21,
                  image: "assets/images/Cloudy.png",
                  time: "11:00",
                ),
                HourlyDataDetails(
                  temperature: 23,
                  image: "assets/images/Cloudy.png",
                  time: "12:00",
                ),
                HourlyDataDetails(
                  temperature: 31,
                  image: "assets/images/Cloudy.png",
                  time: "13:00",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HourlyDataDetails extends StatelessWidget {
  const HourlyDataDetails({
    Key? key,
    required this.temperature,
    required this.image,
    required this.time,
  }) : super(key: key);

  final int temperature;
  final String image;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(defaultPadding / 2),
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
        horizontal: defaultPadding / 1.5,
      ),
      margin: const EdgeInsets.only(right: defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white24,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TemperatureText(
            temperature: "$temperature",
            fontSize: 16.0,
          ),
          const SizedBox(height: defaultPadding / 2),
          Image.asset(
            image,
            height: 30.0,
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
