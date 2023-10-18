import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart' as navigator;

abstract class CustomRoute {
  CustomRoute();

  material.Widget get page;

  String get name;

  Map<String, dynamic> get arguments;

  material.PageRoute asRoute({bool shouldShowAsDialog = false}) {
    return material.MaterialPageRoute(
      builder: (_) => page,
      fullscreenDialog: shouldShowAsDialog,
      settings: material.RouteSettings(name: name, arguments: this),
    );
  }

  static CustomRoute? buildFromRoute(navigator.Route route) {
    if (route.settings.arguments is CustomRoute) {
      return route.settings.arguments as CustomRoute?;
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return '{ "type": "ROUTE", "name": $name, "arguments": $arguments }';
  }
}
