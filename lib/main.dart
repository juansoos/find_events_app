import 'dart:async';

import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/common/storage.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Storage.init();

    final navigatorKey = FlutterModule.navigatorKey();
    runApp(MyApp(navigatorKey: navigatorKey));
  }, (error, stack) {
    Fimber.d('Not handled error $error, stacktrace $stack');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Find Events',
      theme: CustomTheme.material,
      themeMode: ThemeMode.light,
      onGenerateRoute: RouterModule.router().generateRoute,
    );
  }
}
