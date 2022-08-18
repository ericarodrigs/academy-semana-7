import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:algernon/src/shared/constants/text_styles.dart';
import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //! Esperar por alguma coisa?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.blueGradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              duration: const Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 2) - 100,
                    child: Hero(
                      tag: "notes_logo",
                      child: Image.asset(
                        "assets/images/notes_logo.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Hero(
                          tag: "journal",
                          child: const Material(
                            color: Colors.transparent,
                            child: Text(
                              "journal",
                              style: TextStyles.white72w700Montserrat,
                            ),
                          ),
                        ),
                        Text(
                          "YOUR ACADEMY'S BEST FRIEND",
                          style: TextStyles.white13w300Montserrat,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              duration: const Duration(seconds: 1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "powered by",
                      style: TextStyles.white12w200Roboto,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Image.asset("assets/images/raro_academy_logo.png"),
                    const SizedBox(height: 40.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
