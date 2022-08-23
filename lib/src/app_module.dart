import 'package:algernon/src/view/splash/splash_page_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/services/shared_preferences_impl.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind<SharedPreferencesImpl>(
          (i) => SharedPreferencesImpl(),
      onDispose: (service) => service.dispose(),
    ),
  ];


  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashPageModule())
      ];
}
