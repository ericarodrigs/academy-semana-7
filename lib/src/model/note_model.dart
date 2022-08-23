class NoteModel {
  String indexColor;
  String? title;
  String? description;
  String? date;

  NoteModel({this.indexColor = '0', this.title, this.description, this.date});

  Map<String, dynamic> toJson() => {
    'indexColor': indexColor,
    'title': title,
    'description': description,
    'date': date,
  };

  NoteModel.fromJson(Map<String, dynamic> json)
      : indexColor = json['indexColor'],
        title = json['title'],
        description = json['description'],
        date = json['date'];

  @override
  String toString() {
    return '{ $indexColor, $title, $description, $date }';
  }
}
