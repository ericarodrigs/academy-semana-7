class NoteModel {
  String? noteColor;
  String? title;
  String? description;

  NoteModel({
    this.noteColor,
    this.title,
    this.description,
  });

  Map<String, dynamic>  toJson() => {
    'noteColor': noteColor,
    'title': title,
    'description': description,
  };

  NoteModel.fromJson(Map<String, dynamic> json)
      :
        noteColor = json['noteColor'],
        title = json['title'],
        description = json['description'];

  @override
  String toString() {
    return '{ $noteColor, $title, $description }';
  }
}
