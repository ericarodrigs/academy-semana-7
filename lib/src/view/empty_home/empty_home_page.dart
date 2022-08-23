import 'package:algernon/src/core/shared/constants/app_colors.dart';
import 'package:algernon/src/core/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/empty_notes_background.png",
              ),
            ),
            Container(
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
            ),
            Positioned(
              top: 470,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white),
                padding: const EdgeInsets.only(top: 24, right: 40, left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Não importa onde você esteja! Guarde suas ideias pra depois ;) \n',
                      style: TextStyles.purple24w400Roboto,
                    ),
                    Text(
                      'Comece agora a criar as suas notas!',
                      style: TextStyles.cyan16w400Roboto,
                    ),
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
        ));
  }
}
