import 'package:algernon/src/view/filled_home/filled_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilledHomePageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const FilledHomePage()),
  ];
}
