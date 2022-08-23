import 'package:algernon/src/controller/note_controller.dart';
import 'package:algernon/src/core/shared/constants/app_colors.dart';
import 'package:algernon/src/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late NoteController controller = Modular.get();
  String dropdownValueInitial = '0';
  NoteModel note = NoteModel(indexColor: '0',title: '', description: '', date: '' );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String dateFormat() {
      DateTime now = DateTime.now();
      return '${now.day}/${now.month}/${now.year}';
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/app_bar_logo.png'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextFormField(
                  onChanged: (String? title) {
                    controller.setTitle(title!);
                    note.title = title;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: InputBorder.none,
                  ),
                )),
                DropdownButton<String>(
                  value: dropdownValueInitial,
                  onChanged: (String? newIndex) {
                    dropdownValueInitial = newIndex!;
                    controller.setColor(dropdownValueInitial);
                    setState(() {
                      note.indexColor = dropdownValueInitial;
                    });
                  },
                  items: <String>[
                    '0',
                    '1',
                    '2',
                    '3',
                    '4',
                  ].map<DropdownMenuItem<String>>((String index) {
                    return DropdownMenuItem<String>(
                      value: index,
                      child: Icon(
                        Icons.circle,
                        color: AppColors.listColor()[int.parse(index)],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
            Expanded(
                child: TextFormField(
              onChanged: (String? description) {
                controller.setDescription(description!);
                note.description = description;
              },
              decoration: const InputDecoration(
                labelText: 'Digite aqui...',
                border: InputBorder.none,
              ),
            )),
            Center(
                child: ElevatedButton(
              onPressed: () {
                String convertedDate = dateFormat();
                note.date = convertedDate;
                controller.setDate(convertedDate);
                controller.writeNote();
                Modular.to.navigate('/empty/new/details/', arguments: note);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: AppColors.blueGradient,
                ),
                child: Container(
                  width: 73,
                  height: 32,
                  alignment: Alignment.center,
                  child: const Text('SALVAR'),
                ),
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
