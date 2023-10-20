import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/api/repository/city/city_repository.dart';
import 'package:find_events/src/api/repository/event/event_repository.dart';
import 'package:flutter/foundation.dart';

import '../../config/configuration.dart';

class EventViewModel extends ChangeNotifier {
  EventViewModel(
    this._eventRepository,
    this._cityRepository,
    this._router,
  ) {
    citySelected = _cityRepository.getCitySelected();
  }

  final EventRepository _eventRepository;
  final CityRepository _cityRepository;
  final Router _router;

  var isInitialLoadingVisible = true;
  var isMoreLoadingVisible = false;
  var hasMoreEvents = true;
  var page = 1;

  var events = <Event>[];
  String? citySelected;

  Future<void> onInit() async {
    try {
      final response = await _eventRepository.getEventsByCity(citySelected!);

      events = response ?? [];
      isInitialLoadingVisible = false;

      notifyListeners();
    } catch (e) {
      isInitialLoadingVisible = false;
      events = [];

      notifyListeners();
    }
  }

  Future<void> getMoreEvents() async {
    try {
      if (hasMoreEvents) {
        isMoreLoadingVisible = true;
        notifyListeners();

        final nextPage = page + 1;

        final response = await _eventRepository.getEventsByCity(
          citySelected!,
          page: nextPage,
        );

        final newEvents = List.of(events);
        newEvents.addAll(response ?? []);

        events = newEvents;
        isMoreLoadingVisible = false;
        hasMoreEvents = nextPage <= 3;
        page = nextPage;

        notifyListeners();
      }
    } catch (e) {
      isMoreLoadingVisible = false;

      notifyListeners();
    }
  }

  Future<void> onChangeCityClicked() async {
    _router.pushTo(CityPickerRoute());
  }

  void onEventClicked(Event event) {
    _router.pushTo(EventDetailRoute(event));
  }
}
