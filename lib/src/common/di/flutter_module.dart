// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

abstract class FlutterModule {
  static GlobalKey<NavigatorState>? _navigatorKeyInstance;

  static GlobalKey<NavigatorState> navigatorKey() {
    return _navigatorKeyInstance ??= GlobalKey<NavigatorState>();
  }
}
