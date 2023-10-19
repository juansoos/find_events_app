import 'package:find_events/src/api/model/city.dart';
import 'package:find_events/src/api/repository/city/city_repository.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/foundation.dart';

class CityPickerViewModel extends ChangeNotifier {
  CityPickerViewModel(
    this._router,
    this._cityRepository,
  );

  final Router _router;
  final CityRepository _cityRepository;

  List<City> cities = [];
  bool isLoadingVisible = true;

  Future<void> onInit() async {
    final response = await _cityRepository.getCities();

    cities = response;
    isLoadingVisible = false;

    notifyListeners();
  }

  Future<void> onCitySelected(int position) async {
    final citySelected = cities[position];

    await _cityRepository.saveCity(citySelected);

    _router.replaceTo(HomeRoute());
  }
}
