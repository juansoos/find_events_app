import 'package:find_events/src/common/di/flutter_module.dart';
import 'package:find_events/src/common/di/repository_module.dart';
import 'package:find_events/src/config/configuration.dart';

abstract class RouterModule {
  static Router router() {
    final navigatorKey = FlutterModule.navigatorKey();

    return Router(
      navigatorKey,
      RepositoryModule.userRepository(),
    );
  }
}
