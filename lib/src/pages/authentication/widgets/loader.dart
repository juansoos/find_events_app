import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "We are validating your information, give us a moment.",
          textAlign: TextAlign.center,
          style: CustomTypography.headline3,
        ),
        SizedBox(height: 40),
        CircularProgressIndicator()
      ],
    );
  }
}
