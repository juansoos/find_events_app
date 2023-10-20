import 'package:find_events/generated/l10n.dart';
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
    final i18n = I18n();

    if (description.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Column(
        children: [
          const SizedBox(height: 20),
          Text(
            i18n.description,
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
