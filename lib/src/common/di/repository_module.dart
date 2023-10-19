import 'package:find_events/src/api/repository/user/user_repository.dart';
import 'package:find_events/src/common/di/storage_module.dart';

abstract class RepositoryModule {
  static UserRepository userRepository() {
    return UserRepository(StorageModule.userStorage());
  }
}
