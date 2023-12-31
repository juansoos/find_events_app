import 'package:find_events/src/api/repository/city/city_repository.dart';
import 'package:find_events/src/api/repository/event/event_repository.dart';
import 'package:find_events/src/api/repository/user/user_repository.dart';
import 'package:find_events/src/common/di/http_client_module.dart';
import 'package:find_events/src/common/di/storage_module.dart';

abstract class RepositoryModule {
  static UserRepository userRepository() {
    return UserRepository(StorageModule.userStorage());
  }

  static CityRepository cityRepository() {
    return CityRepository(StorageModule.cityStorage());
  }

  static EventRepository eventRepository() {
    return EventRepository(HttpClientModule.httpClient());
  }
}
