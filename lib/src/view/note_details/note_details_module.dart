import 'package:algernon/src/view/filled_home/filled_home_page_module.dart';
import 'package:algernon/src/view/note_details/note_details.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NoteDetailsModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const NoteDetails()),
    ModuleRoute('/filled', module: FilledHomePageModule())
  ];
}
