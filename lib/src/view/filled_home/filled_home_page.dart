import 'package:algernon/src/controller/note_controller.dart';
import 'package:algernon/src/model/note_model.dart';
import 'package:algernon/src/services/shared_preferences_service.dart';
import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:algernon/src/widgets/note_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilledHomePage extends StatefulWidget {
  const FilledHomePage({Key? key}) : super(key: key);

  @override
  State<FilledHomePage> createState() => _FilledHomePageState();
}

class _FilledHomePageState extends State<FilledHomePage> {
  SharedPreferencesService service = SharedPreferencesService();
  late NoteController controller;
  List<NoteModel> listNotes = [];

  @override
  void initState() {
    controller = NoteController(service);
    controller.getNote().then((notesShared) async => {
      if (notesShared != null){
        listNotes = notesShared,
        setState(() {}),
      }
    });
    super.initState();
  }

  action(NoteModel note) {
    controller.deleteNote(note);
    removeFromListNotes(note);
    removeFromSharedPreferences(note);
    Modular.to.pop();
  }

  void removeFromListNotes(NoteModel note) {
    listNotes.removeWhere((element) =>
    element.description == note.description &&
        element.title == note.title &&
        element.indexColor == note.indexColor);
  }
  void removeFromSharedPreferences(NoteModel note) {
    controller.deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/app_bar_logo.png'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: GridView.builder(
          itemCount: listNotes.length,
          itemBuilder: (context, index) {
            return NoteWidget(
              note: listNotes[index],
              action: () {
                setState(() {
                  action(listNotes[index]);
                });
              },
            );
          },
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.blueGradient,
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          onPressed: () {
            Modular.to.pushNamed('/empty/new/');
          },
        ));
  }
}
