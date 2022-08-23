import 'package:algernon/src/controller/note_controller.dart';
import 'package:algernon/src/core/services/shared_preferences_impl.dart';
import 'package:algernon/src/view/new_note/new_note.dart';
import 'package:algernon/src/view/note_details/note_details.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewNoteModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind<NoteController>(
          (i) => NoteController(i.get<SharedPreferencesImpl>()),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const NewNote()),
    ChildRoute('/details/', child: (context, args) => NoteDetails(note: args.data)),
  ];
}
