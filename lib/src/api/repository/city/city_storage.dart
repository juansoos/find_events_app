import 'package:find_events/src/api/model/city.dart';
import 'package:find_events/src/common/storage.dart';

class CityStorage {
  CityStorage(this._storage);

  static const String _keyCity = 'city_storage.city';

  final Storage _storage;

  String? get city => _storage.getString(_keyCity);

  Future<void> saveCity(City city) async {
    await _storage.setString(_keyCity, city.name);
  }

  Future<void> reload() async {
    return _storage.reload();
  }

  Future<void> clear() async {
    await _storage.clear();
  }
}
