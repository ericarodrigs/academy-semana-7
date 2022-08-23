import 'dart:convert';
import 'package:algernon/src/core/services/local_storage_interface.dart';
import 'package:algernon/src/model/note_model.dart';

class NoteController {
  final LocalStorageInterface sharedPreferences;

  NoteModel noteModel = NoteModel(indexColor: '0', description: '', title: '', date: '01/10/10');

  NoteController(this.sharedPreferences);

  Future<List<NoteModel>?> getNote() async {
    var notesJson = await sharedPreferences.read('notes');
    if (notesJson != null) {
      var decodeNotes = jsonDecode(notesJson) as List;
      List<NoteModel> notes =
      decodeNotes.map((notesJ) => NoteModel.fromJson(notesJ)).toList();
      return notes;
    } else {
      return null;
    }
  }

  Future<void> writeNote() async {
    List<NoteModel> notes = [];
    getNote().then((notesShared) async => {
      if (notesShared != null)
        {
          notes = notesShared,
        },
      notes.add(noteModel),
      await sharedPreferences.writeString('notes', jsonEncode(notes))
    });
  }

  Future<void> deleteNote(NoteModel note) async {
    List<NoteModel> notes = [];
    getNote().then((notesShared) async => {
      if (notesShared != null)
        {
          notes = notesShared,
        },
      notes.removeWhere((element) =>
      element.description == note.description &&
          element.title == note.title &&
          element.indexColor == note.indexColor),
      await sharedPreferences.writeString('notes', jsonEncode(notes))
    });
  }

  void setColor(String noteColor) {
    noteModel.indexColor = noteColor;
  }

  void setTitle(String title) {
    noteModel.title = title;
  }

  void setDescription(String description) {
    noteModel.description = description;
  }

  void setDate(String date) {
    noteModel.date = date;
  }
}
