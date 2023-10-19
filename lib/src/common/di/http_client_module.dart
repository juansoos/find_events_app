import 'package:find_events/src/api/http_client.dart';

abstract class HttpClientModule {
  static HttpClient httpClient() {
    return HttpClient("https://api.seatgeek.com/2");
  }
}
