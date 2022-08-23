import 'package:algernon/src/core/shared/constants/app_colors.dart';
import 'package:algernon/src/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({Key? key, required note}) : super(key: key);

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  DateTime now = DateTime.now();
  NoteModel note = Modular.args.data;

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
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(note.title!,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.54),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                  ),)),
              Icon(
                Icons.circle,
                color: AppColors.listColor()[int.parse(note.indexColor)],
              ),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 1, height: 45,),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text( "Data: ${note.date!}",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.54),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ]),
          const Divider(color: Colors.grey, thickness: 1, height: 45,),
          Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(note.description!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                    ),),
              )),
          Center(
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/filled/');
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
                    child: const Text(
                      'OK',
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
