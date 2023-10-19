import 'package:find_events/src/api/repository/city/city_storage.dart';
import 'package:find_events/src/api/repository/user/user_storage.dart';
import 'package:find_events/src/common/storage.dart';

abstract class StorageModule {
  static UserStorage userStorage() {
    return UserStorage(Storage.instance);
  }

  static CityStorage cityStorage() {
    return CityStorage(Storage.instance);
  }
}
