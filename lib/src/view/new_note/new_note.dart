import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewNote extends StatelessWidget {
  const NewNote({Key? key}) : super(key: key);

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
              decoration: const InputDecoration(
                labelText: 'Digite aqui...',
                border: InputBorder.none,
              ),
            )),
            // Container(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text('SALVAR'),
            //     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.blueGradient)),
            //   ),
            // )
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
                    onPressed: (){
                      Modular.to.pushNamed('/details/');
                    },
                      child:Text("SALVAR"),
                )
            )
          ]),
        ),
      ),
    );
  }
}
