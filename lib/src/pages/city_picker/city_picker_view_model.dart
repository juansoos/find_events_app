import 'package:find_events/src/config/configuration.dart';

class CityPickerViewModel {
  final Router _router;

  CityPickerViewModel(this._router);

  final List<String> cities = [
    'New York',
    'London',
    'Paris',
    'Tokyo',
    'Sydney'
  ];

  void onCitySelected(int position) {
    print(cities[position]);

    _router.replaceTo(HomeRoute());
  }
}
