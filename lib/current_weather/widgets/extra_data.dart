import 'package:flutter/material.dart';

import '../../constants.dart';

class ExtraData extends StatelessWidget {
  const ExtraData({
    Key? key,
    required this.image,
    required this.text,
    required this.type,
  }) : super(key: key);

  final String image;
  final String text;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 24.0,
        ),
        const SizedBox(height: defaultPadding / 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          type,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}