import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class EventDetailDescription extends StatelessWidget {
  const EventDetailDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    if (description.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Description",
            style: CustomTypography.headline3,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: CustomTypography.body3,
            textAlign: TextAlign.justify,
          ),
        ],
      );
    }
  }
}
