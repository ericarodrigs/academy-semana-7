import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/empty_notes_background.png",
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 208),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/notes_logo.png",
                      width: 33,
                      height: 34,
                    ),
                    Image.asset(
                      "assets/images/journal.png",
                      width: 178,
                      height: 54,
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: Column(
                children: const [
                  Text(
                      'Não importa onde você esteja! Guarde suas ideias pra depois ;)'),
                  Text('Comece agora a criar as suas notas!'),
                ],
              ),
            ),
          ),
        ],
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
        )
    );
  }
}
