import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InicioMobileView extends StatelessWidget {
  const InicioMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _screenWidth,
      height: _screenHeight * 0.4,
      color: Theme.of(context).colorScheme.surface, // Color de fondo dinámico
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: _screenHeight * 0.05,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: SizedBox(
                        width: _screenWidth * 0.8,
                        child: Text(
                          'Yamil Saad',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: _screenWidth * 0.13,
                              fontFamily: "Ruik",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
                        color: Color(0xff21E6C1),
                        width: _screenWidth * 0.55,
                        child: Text(
                          'Front End Engineer',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff433D8B),
                              fontSize: _screenWidth * 0.055,
                              fontFamily: "Ruik",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.025,
                    ),
                    SizedBox(
                      width: _screenWidth * 0.85,
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        stopPauseOnTap: true,
                        animatedTexts: [
                          TyperAnimatedText('Web, Mobile and Systems',
                              speed: Duration(milliseconds: 200),
                              textAlign: TextAlign.left,
                              textStyle: TextStyle(
                                  fontSize: _screenWidth * 0.065,
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
          ),
          SizedBox(
            height: _screenHeight * 0.025,
          ),
          FadeIn(
            duration: Duration(milliseconds: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _socialIcon(FontAwesomeIcons.linkedin, _screenWidth,
                      "https://www.linkedin.com/in/yamilsaad/"),
                  SizedBox(height: _screenWidth * 0.025),
                  _socialIcon(FontAwesomeIcons.instagram, _screenWidth,
                      "https://www.instagram.com/saad_yamil/"),
                  SizedBox(height: _screenWidth * 0.025),
                  _socialIcon(FontAwesomeIcons.github, _screenWidth,
                      "https://github.com/yamilsaad"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, double screenWidth, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            debugPrint("No se pudo abrir la URL: $url");
          }
        },
        borderRadius:
            BorderRadius.circular(50), // Para efecto circular en el toque

        child: Icon(
          icon,
          color: Colors.white,
          size:
              screenWidth * 0.09, // Ajusta el tamaño del ícono en base al ancho
        ),
      ),
    );
  }
}
