import 'dart:convert';

import 'package:find_events/src/api/http_client.dart';
import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/api/model/event_response.dart';

class EventRepository {
  EventRepository(this._service);

  final HttpClient _service;

  Future<List<Event>?> getEventsByCity(String city, {int? page = 1}) async {
    try {
      final cityRaw = city.replaceAll(' ', '%20');
      final path =
          '/events?venue.city=$cityRaw&client_id=Mzc2NDM1ODF8MTY5NzczMDk5NS4xNTY1Nzg4&per_page=10&page=$page';

      final response = await _service.get(path);

      return EventResponse.fromJson(jsonDecode(response.body)).events;
    } catch (e) {
      return null;
    }
  }
}
