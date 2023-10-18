import 'package:find_events/src/config/configuration.dart';

class AuthenticationViewModel {
  String email = '';
  String password = '';

  final Router _router;

  AuthenticationViewModel(this._router);

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  void onSubmitClicked() {
    print('Email: $email');
    print('Password: $password');

    _router.pushTo(CityPickerRoute());
  }
}
