import 'package:url_launcher/url_launcher.dart';

class EventDetailViewModel {
  Future<void> onLaunchClicked(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
