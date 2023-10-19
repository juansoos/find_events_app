import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/api/repository/city/city_repository.dart';
import 'package:find_events/src/api/repository/event/event_repository.dart';
import 'package:flutter/foundation.dart';

class EventViewModel extends ChangeNotifier {
  EventViewModel(this._eventRepository, this._cityRepository);

  final EventRepository _eventRepository;
  final CityRepository _cityRepository;

  var isLoadingVisible = true;
  var events = <Event>[];

  Future<void> onInit() async {
    try {
      final citySelected = _cityRepository.getCitySelected();

      final response = await _eventRepository.getEventsByCity(citySelected!);

      events = response ?? [];
      isLoadingVisible = false;

      notifyListeners();
    } catch (e) {
      isLoadingVisible = false;
      events = [];

      notifyListeners();
    }
  }
}
