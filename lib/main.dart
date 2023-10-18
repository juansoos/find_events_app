import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Events',
      theme: CustomTheme.material,
      themeMode: ThemeMode.light,
      onGenerateRoute: RouterModule.router().generateRoute,
    );
  }
}
