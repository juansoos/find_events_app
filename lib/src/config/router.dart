import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/api/repository/city/city_repository.dart';
import 'package:find_events/src/api/repository/user/user_repository.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:find_events/src/pages/authentication/authentication_page.dart';
import 'package:find_events/src/pages/city_picker/city_picker_page.dart';
import 'package:find_events/src/pages/event_detail/event_detail_page.dart';
import 'package:find_events/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class Router {
  Router(this._navigatorKey, this._userRepository, this._cityRepository);

  final GlobalKey<NavigatorState> _navigatorKey;
  final UserRepository _userRepository;
  final CityRepository _cityRepository;

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
    if (_cityRepository.citySelectedExist) {
      return HomeRoute();
    } else if (_userRepository.userExists) {
      return CityPickerRoute();
    } else {
      return AuthenticationRoute();
    }
  }

  Future pushTo(CustomRoute route, {bool shouldShowAsDialog = false}) {
    Fimber.d('Push to: $route');

    final pageRoute = route.asRoute(shouldShowAsDialog: shouldShowAsDialog);
    return _navigatorKey.currentState!.push(pageRoute);
  }

  Future replaceTo(CustomRoute route) {
    Fimber.d('Replace to: $route');

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

class EventDetailRoute extends CustomRoute {
  EventDetailRoute(this.event);

  final Event event;

  @override
  Map<String, dynamic> get arguments => {'event': event.toString()};

  @override
  String get name => 'EVENT_DETAIL';

  @override
  Widget get page => EventDetailPage(event: event);
}
