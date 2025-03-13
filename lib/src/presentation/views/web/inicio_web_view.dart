import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class InicioWebView extends StatelessWidget {
  const InicioWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _screenWidth,
      height: _screenHeight * 0.9,
      color: Theme.of(context).colorScheme.surface, // Color de fondo dinámico
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: _screenHeight * 0.25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: SizedBox(
                        width: _screenWidth * 0.5,
                        child: Text(
                          'Yamil Saad',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: _screenWidth * 0.05,
                              fontFamily: "Ruik",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                        color: Color(0xff21E6C1),
                        width: _screenWidth * 0.25,
                        child: Text(
                          'Front End Engineer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff433D8B),
                              fontSize: _screenWidth * 0.025,
                              fontFamily: "Ruik",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _screenWidth * 0.5,
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        stopPauseOnTap: true,
                        animatedTexts: [
                          TyperAnimatedText('Web, Mobile and Systems',
                              speed: Duration(milliseconds: 200),
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  fontSize: _screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff36eee0)))
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: _screenWidth * 0.035,
              ),
              /*FadeInDown(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 1300),
                child: SizedBox(
                  height: _screenHeight * 0.8,
                  width: _screenWidth * 0.38,
                  child: Image.asset(
                    'assets/img/photos/logo1_trans.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
