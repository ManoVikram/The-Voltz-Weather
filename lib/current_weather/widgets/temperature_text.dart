import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SvgPicture.asset(
                "assets/icons/DegreeCelcius.svg",
                // height: 50.0,
                height: fontSize / 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
