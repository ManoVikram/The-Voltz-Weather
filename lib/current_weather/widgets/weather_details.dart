import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

import './extra_data.dart';
import './temperature_text.dart';

import '../models/models.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key? key,
    required this.size,
    required this.weatherDetails,
  }) : super(key: key);

  final Size size;
  final WeatherInfo weatherDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF11B3fC),
            primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(60.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 12.0),
            color: primaryColor.withOpacity(0.6),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.white,
                  ),
                  Text(
                    "India",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/Sunny_Cloudy_Thunder_Rain_Extra.png",
                height: size.height * 0.28,
              ),
              const SizedBox(height: defaultPadding / 2),
              // const TemperatureText(temperature: "21"),
              TemperatureText(
                  temperature: weatherDetails.temperature.toStringAsFixed(1)),
              const Text(
                "Rainy",
                style: TextStyle(
                  height: 0.75,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: defaultPadding / 3),
              const Text(
                "Monday, 23 May",
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                height: 1.0,
                width: size.width * 0.9,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      Colors.white54,
                      primaryColor,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  ExtraData(
                    image: "assets/images/Cloudy_Thunder_Rain.png",
                    text: "13 km/h",
                    type: "Wind",
                  ),
                  ExtraData(
                    image: "assets/images/Moon.png",
                    text: "13 km/h",
                    type: "Wind",
                  ),
                  ExtraData(
                    image: "assets/images/Thunder.png",
                    text: "13 km/h",
                    type: "Wind",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
