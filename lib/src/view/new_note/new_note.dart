import 'package:algernon/src/controller/note_controller.dart';
import 'package:algernon/src/services/shared_preferences_service.dart';
import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {

  SharedPreferencesService service = SharedPreferencesService();

  late NoteController controller;

  @override
  void initState() {
    controller = NoteController(service);
    super.initState();
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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextFormField(
                      onChanged: controller.setTitle,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: InputBorder.none,
                  ),
                )),
                const Text('cores')
              ],
            ),
            Expanded(
                child: TextFormField(
                  onChanged: controller.setDescription,
              decoration: const InputDecoration(
                labelText: 'Digite aqui...',
                border: InputBorder.none,
              ),
            )),
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: AppColors.blueGradient,
                    borderRadius: BorderRadius.circular(4),
                ),
                child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      controller.writeNote();
                      Modular.to.pushNamed('/empty/new/details/');
                    },
                      child:Text("SALVAR"),
                )
            ),
          ]),
        ),
      ),
    );
  }
}
