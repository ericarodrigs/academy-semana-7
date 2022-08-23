import 'package:algernon/src/controller/note_controller.dart';
import 'package:algernon/src/core/services/shared_preferences_impl.dart';
import 'package:algernon/src/view/filled_home/filled_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilledHomePageModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind<NoteController>(
          (i) => NoteController(i.get<SharedPreferencesImpl>()),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const FilledHomePage()),
  ];
}
