import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    Key? key,
    required this.temperature,
    this.fontSize = 120.0,
  }) : super(key: key);

  final String temperature;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          temperature,
          style: TextStyle(
            // fontSize: Theme.of(context).textTheme.headline1?.fontSize,
            height: 1.0,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Positioned(
          top: 0.0,
          right: 0.0,
          child: Text(
            "o",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
