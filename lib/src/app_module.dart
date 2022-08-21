import 'package:algernon/src/view/empty_home/empty_home_page.dart';
import 'package:algernon/src/view/empty_home/empty_home_page_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const EmptyHomePage()),
        ModuleRoute(Modular.initialRoute, module: EmptyHomePageModule()),
      ];
}
