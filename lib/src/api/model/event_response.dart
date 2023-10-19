import 'package:find_events/src/api/model/event.dart';

class EventResponse {
  EventResponse({this.events});

  List<Event>? events;

  EventResponse.fromJson(Map<String, dynamic> json) {
    try {
      if (json['events'] != null) {
        events = <Event>[];
        json['events'].forEach((event) {
          events!.add(Event.fromJson(event));
        });
      }
    } catch (e, stack) {
      print(e);
      print(stack);
    }
  }
}
