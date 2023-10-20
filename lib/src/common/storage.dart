import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static Storage? _instance;

  static Storage get instance {
    final instance = _instance;

    if (instance == null) {
      throw Exception("instance called before calling init");
    }

    return instance;
  }

  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Fimber.d('Shared preferences initialized');
    _instance = Storage._(sharedPreferences);
  }

  Future<void> setString(String key, String? value) async {
    if (value != null) {
      await _sharedPreferences.setString(key, value);
    } else {
      _sharedPreferences.remove(key);
    }
  }

  String? getString(String key) => _sharedPreferences.getString(key);

  /*
  Should call reload() before reading from it to update its cache with any external changes.
  For example, reading after data has been deleted.
   */
  Future<void> reload() async {
    return _sharedPreferences.reload();
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
