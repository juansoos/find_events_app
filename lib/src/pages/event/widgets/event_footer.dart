import 'package:find_events/generated/l10n.dart';
import 'package:flutter/material.dart';

class EventFooter extends StatelessWidget {
  const EventFooter({
    super.key,
    required this.isLoadingVisible,
    required this.hasMoreElements,
  });

  final bool isLoadingVisible;
  final bool hasMoreElements;

  @override
  Widget build(BuildContext context) {
    final i18n = I18n();

    if (isLoadingVisible) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: const CircularProgressIndicator(),
      );
    }

    if (!hasMoreElements) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(i18n.noMoreEvents),
      );
    }

    return const SizedBox.shrink();
  }
}
