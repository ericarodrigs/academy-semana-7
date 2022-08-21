import 'package:algernon/src/view/empty_home/empty_home_page.dart';
import 'package:algernon/src/view/empty_home/empty_home_page_module.dart';
import 'package:algernon/src/view/filled_home/filled_home_page.dart';
import 'package:algernon/src/view/filled_home/filled_home_page_module.dart';
import 'package:algernon/src/view/new_note/new_note_module.dart';
import 'package:algernon/src/view/note_details/note_details_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [

        ModuleRoute(Modular.initialRoute, module: FilledHomePageModule()),
        ];
}
