import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class EventCurrentCity extends StatelessWidget {
  const EventCurrentCity({
    super.key,
    required this.citySelected,
    required this.onChangeCityClicked,
  });

  final String citySelected;
  final void Function()? onChangeCityClicked;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onChangeCityClicked,
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            citySelected,
            style: CustomTypography.caption1.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
