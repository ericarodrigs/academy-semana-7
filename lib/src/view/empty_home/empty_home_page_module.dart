import 'package:algernon/src/view/empty_home/empty_home_page.dart';
import 'package:algernon/src/view/new_note/new_note_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EmptyHomePageModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const EmptyHomePage()),
    ModuleRoute('/new', module: NewNoteModule())
  ];
}
