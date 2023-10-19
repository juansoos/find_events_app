import 'package:find_events/src/api/model/user.dart';
import 'package:find_events/src/api/repository/user/user_storage.dart';

class UserRepository {
  UserRepository(this._storage);

  final UserStorage _storage;

  bool get userExists => _storage.userEmail != null;

  Future<User> signInWithEmailAndPassword(User user) async {
    await _storage.saveUser(user);

    // Emulate http request
    await Future.delayed(const Duration(seconds: 2));

    return Future.value(user);
  }
}
