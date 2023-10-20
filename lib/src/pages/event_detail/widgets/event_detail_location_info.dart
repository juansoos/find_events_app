import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class EventDetailLocationInfo extends StatelessWidget {
  const EventDetailLocationInfo({
    super.key,
    required this.location,
    required this.date,
  });

  final String location;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 14),
            const SizedBox(width: 4),
            Text(location, style: CustomTypography.body3),
          ],
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            const Icon(Icons.calendar_month_outlined, size: 14),
            const SizedBox(width: 4),
            Text(date, style: CustomTypography.body3)
          ],
        )
      ],
    );
  }
}
