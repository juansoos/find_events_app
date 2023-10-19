import 'package:find_events/src/api/model/user.dart';
import 'package:find_events/src/api/repository/user/user_repository.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/foundation.dart';

class AuthenticationViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool isLoadingVisible = false;

  final Router _router;
  final UserRepository _userRepository;

  AuthenticationViewModel(this._router, this._userRepository);

  void onEmailChanged(String value) {
    _email = value;
  }

  void onPasswordChanged(String value) {
    _password = value;
  }

  Future<void> onSubmitClicked() async {
    isLoadingVisible = true;
    notifyListeners();

    final user = User(email: _email, password: _password);

    await _userRepository.signInWithEmailAndPassword(user);

    _router.pushTo(CityPickerRoute());

    isLoadingVisible = false;
    notifyListeners();
  }
}
