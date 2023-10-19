import 'package:find_events/src/api/interactor/logout_interactor.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/foundation.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel(this._router, this._logoutInteractor);

  final Router _router;
  final LogoutInteractor _logoutInteractor;

  Future<void> onLogoutClicked() async {
    await _logoutInteractor();

    _router.replaceTo(AuthenticationRoute());
  }

  Future<void> onChangeCityClicked() async {
    _router.pushTo(CityPickerRoute());
  }
}
