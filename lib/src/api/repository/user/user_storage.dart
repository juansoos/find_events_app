import 'package:find_events/src/api/model/user.dart';
import 'package:find_events/src/common/storage.dart';

class UserStorage {
  UserStorage(this._storage);

  static const String _keyUserEmail = 'user_storage.email';

  final Storage _storage;

  Future<void> saveUser(User user) async {
    await Future.wait([
      _storage.setString(_keyUserEmail, user.email),
    ]);
  }

  String? get userEmail => _storage.getString(_keyUserEmail);

  Future<void> reload() async {
    return _storage.reload();
  }

  Future<void> clear() async {
    await _storage.clear();
  }
}
