import 'package:algernon/src/model/note_model.dart';
import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:algernon/src/widgets/note_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilledHomePage extends StatelessWidget {
  FilledHomePage({Key? key}) : super(key: key);

  List<NoteModel> listNotes = [
    NoteModel(AppColors.green, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.yellow, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.cyan, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.purple, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.pink, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.green, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.yellow, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.cyan, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.purple, 'Nao esquecer', 'Primeiro card pra testar'),
    NoteModel(AppColors.pink, 'Nao esquecer', 'Primeiro card pra testar'),
  ];

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
            return NoteWidget(note: listNotes[index]);
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
            Modular.to.pushNamed('/details');
          },
        ));
  }
}
