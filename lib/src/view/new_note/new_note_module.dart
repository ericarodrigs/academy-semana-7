import 'package:algernon/src/view/new_note/new_note.dart';
import 'package:algernon/src/view/note_details/note_details_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewNoteModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const NewNote()),
    ModuleRoute('/details', module: NoteDetailsModule()),
  ];
}
