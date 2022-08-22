import 'dart:convert';

import 'package:algernon/src/model/note_model.dart';
import 'package:algernon/src/services/shared_preferences_service.dart';

class NoteController {
  final SharedPreferencesService service;
  NoteModel noteModel = NoteModel('Colors.white', '', '');

  NoteController(this.service);

  Future<List<NoteModel>?> getNote() async {
    var notesJson = await service.read('notes');
    if (notesJson != null) {
      var decodeNotes = jsonDecode(notesJson) as List;
      List<NoteModel> notes = decodeNotes.map((notesJ) => NoteModel.fromJson(notesJ)).toList();
      return notes;
    } else {
      return null;
    }
  }

  Future<void> writeNote() async {
    List<NoteModel> notes = [];
    getNote().then((notesShared) async => {
      if (notesShared != null){
        notes = notesShared,
      } ,
      notes.add(noteModel),
      await service.writeString('notes',  jsonEncode(notes))
    });
  }

  void setColor(String noteColor) {
    noteModel.noteColor = noteColor;
  }

  void setTitle(String title) {
    noteModel.title = title;
  }

  void setDescription(String description) {
    noteModel.description = description;
  }
}