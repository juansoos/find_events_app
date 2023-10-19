import 'package:find_events/src/common/storage.dart';

class LogoutInteractor {
  LogoutInteractor(this._storage);

  final Storage _storage;

  Future<void> call() async {
    await Future.wait([
      _storage.clear(),
      _storage.reload(),
    ]);
  }
}
