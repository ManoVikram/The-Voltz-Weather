import 'package:flutter/material.dart';

import '../../constants.dart';

import './temperature_text.dart';

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
      // padding: const EdgeInsets.all(defaultpadding / 2),
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
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TemperatureText(
              temperature: "$temperature",
              fontSize: 12.0,
            ),
            /* Text(
              "$temperature deg",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ), */
            const SizedBox(height: defaultPadding / 2),
            Image.asset(
              image,
              height: 24.0,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
