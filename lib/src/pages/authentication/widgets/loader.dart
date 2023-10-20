import 'package:find_events/generated/l10n.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = I18n();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          i18n.weAreValidatingInformation,
          textAlign: TextAlign.center,
          style: CustomTypography.headline3,
        ),
        const SizedBox(height: 40),
        const CircularProgressIndicator()
      ],
    );
  }
}
