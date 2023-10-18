import 'package:find_events/src/config/configuration.dart';
import 'package:find_events/src/pages/authentication/authentication_page.dart';
import 'package:find_events/src/pages/city_picker/city_picker_page.dart';
import 'package:find_events/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Router {
  Router(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    final route = mapToRoute(settings)!;
    return route.asRoute();
  }

  CustomRoute? mapToRoute(RouteSettings settings) {
    CustomRoute? route;

    if (settings.arguments == null) {
      route = initialRoute;
    } else {
      route = settings.arguments as CustomRoute?;
    }

    return route;
  }

  CustomRoute get initialRoute {
    return AuthenticationRoute();
  }

  Future pushTo(CustomRoute route, {bool shouldShowAsDialog = false}) {
    print('Push to: $route');

    final pageRoute = route.asRoute(shouldShowAsDialog: shouldShowAsDialog);
    return _navigatorKey.currentState!.push(pageRoute);
  }

  Future replaceTo(CustomRoute route) {
    print('Replace to: $route');

    return _navigatorKey.currentState!
        .pushAndRemoveUntil(route.asRoute(), (route) => false);
  }

  void pop<T extends Object>([T? result]) {
    _navigatorKey.currentState!.pop(result);
  }
}

class AuthenticationRoute extends CustomRoute {
  @override
  Map<String, dynamic> get arguments => const {};

  @override
  String get name => 'AUTHENTICATION';

  @override
  Widget get page => const AuthenticationPage();
}

class CityPickerRoute extends CustomRoute {
  @override
  Map<String, dynamic> get arguments => const {};

  @override
  Widget get page => const CityPickerPage();

  @override
  String get name => 'CITY_PICKER';
}

class HomeRoute extends CustomRoute {
  @override
  Map<String, dynamic> get arguments => const {};

  @override
  String get name => 'HOME';

  @override
  Widget get page => const HomePage();
}
