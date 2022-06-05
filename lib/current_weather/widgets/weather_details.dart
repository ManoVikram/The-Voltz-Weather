import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

import './extra_data.dart';
import './temperature_text.dart';

import '../models/models.dart';
import '../bloc/bloc.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key? key,
    required this.size,
    required this.weatherDetails,
    required this.location,
  }) : super(key: key);

  final Size size;
  final WeatherInfo weatherDetails;
  final String location;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(const FetchWeather());
                    },
                    child: const Icon(CupertinoIcons.refresh),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.location_solid,
                        color: Colors.white,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(
                weatherDetails.weatherIcon,
                height: size.height * 0.26,
              ),
              const SizedBox(height: defaultPadding / 2),
              TemperatureText(
                  temperature: weatherDetails.temperature.toStringAsFixed(1)),
              Text(
                weatherDetails.mainWeather,
                style: const TextStyle(
                  height: 0.75,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: defaultPadding / 3),
              Text(
                DateFormat("EEEE, dd MMMM").format(weatherDetails.timestamp),
                style: const TextStyle(
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
                children: [
                  ExtraData(
                    image: "assets/images/Wind.png",
                    text: "${weatherDetails.wind} km/h",
                    type: "Wind",
                  ),
                  ExtraData(
                    image: "assets/images/WaterDrop.png",
                    text: "${weatherDetails.humidity}%",
                    type: "Humidity",
                  ),
                  ExtraData(
                    image: "assets/images/Thermometer_Light.png",
                    text:
                        "${weatherDetails.feelsLikeTemperature.toStringAsFixed(1)} °C",
                    type: "Feels Like",
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
