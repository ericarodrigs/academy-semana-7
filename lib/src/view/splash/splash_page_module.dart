import 'package:algernon/src/view/empty_home/empty_home_page_module.dart';
import 'package:algernon/src/view/filled_home/filled_home_page_module.dart';
import 'package:algernon/src/view/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const SplashPage()),
    ModuleRoute('/empty', module: EmptyHomePageModule()),
    ModuleRoute('/filled', module: FilledHomePageModule())
  ];
}
