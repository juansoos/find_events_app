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

  var isLoadingVisible = true;
  var events = <Event>[];
  String? citySelected;

  Future<void> onInit() async {
    try {
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

  Future<void> onChangeCityClicked() async {
    _router.pushTo(CityPickerRoute());
  }
}
