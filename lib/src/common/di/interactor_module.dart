import 'package:find_events/src/api/interactor/logout_interactor.dart';
import 'package:find_events/src/common/storage.dart';

abstract class InteractorModule {
  static LogoutInteractor logoutInteractor() {
    return LogoutInteractor(Storage.instance);
  }
}
