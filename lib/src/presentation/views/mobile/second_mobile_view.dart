import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SecondMobileView extends StatefulWidget {
  SecondMobileView({super.key});

  @override
  State<SecondMobileView> createState() => _SecondMobileViewState();
}

class _SecondMobileViewState extends State<SecondMobileView> {
  bool _isVisible = false;
  String selectedButton = "Sobre mí";

  final Map<String, String> infoTexts = {
    "Sobre mí":
        "Soy Técnico Superior en Programación y estudiante de Licenciatura en Informática, especializado en Flutter. Con experiencia en desarrollo web y móvil, me apasiona crear interfaces intuitivas y optimizadas. Mis conocimientos en backend me permiten diseñar soluciones escalables y bien estructuradas. Como freelancer, transformo ideas en productos digitales impactantes, aplicando buenas prácticas, optimización y accesibilidad.",
    "Mis hobbies":
        "Me gusta programar, leer un buen libro, jugar videojuegos, ir al gimnasio y hacer actividades al aire libre. Además suelo disfrutar de caminatas solitarias, reuniones familiares, jugar con mis hijas y tomar mate o algún refresco con mis amigos más cercanos periodicamente.",
    "Voluntariados":
        "Actualmente participo activamente como voluntario en Family Search. A través de una plataforma web, entre otras herramientas móviles, asesoro y asisto a personas que desean armar su árbol genealógico, buscar registros antiguos y crear recuerdos o historias para sus familias.",
  };

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: _screenWidth,
      height: _screenHeight * 0.7,
      child: VisibilityDetector(
        key: Key('second_view_mobile'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoTexts.keys.map((key) {
                        return _CustomButton(
                          text: key,
                          isSelected: selectedButton == key,
                          onTap: () {
                            setState(() {
                              selectedButton = key;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: _screenHeight * 0.02),
                  FadeInUp(
                    duration: Duration(milliseconds: 1500),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: _screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xff21E6C1),
                            width: 2.0,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  infoTexts[selectedButton]!,
                                  style: TextStyle(
                                    fontSize: _screenWidth * 0.05,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Rubik",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _CustomButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: _screenWidth * 0.045,
            fontWeight: FontWeight.w600,
            color: isSelected ? Color(0xff21E6C1) : Colors.white,
          ),
        ),
      ),
    );
  }
}
