import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shimmer/shimmer.dart';

import 'package:visibility_detector/visibility_detector.dart';

class SecondWebView extends StatefulWidget {
  SecondWebView({super.key});

  @override
  State<SecondWebView> createState() => _SecondWebViewState();
}

class _SecondWebViewState extends State<SecondWebView> {
  bool _isVisible = false;
  String infoText =
      "Soy Técnico Superior en Programación y estudiante de la Licenciatura en Informática con amplia experiencia en desarrollo web y móvil, especializado en Flutter y tecnologías modernas. Me apasiona crear interfaces intuitivas, dinámicas y optimizadas para ofrecer experiencias de usuario excepcionales. Mi capacidad de análisis y resolución de problemas me permite desarrollar soluciones eficientes y escalables. Además, mis conocimientos en backend me brindan una visión integral del desarrollo, permitiéndome diseñar arquitecturas sólidas y bien estructuradas. Como freelancer, he trabajado en diversos proyectos, colaborando con clientes para transformar ideas en productos digitales impactantes. Siempre busco innovar y mejorar, aplicando buenas prácticas de desarrollo, optimización del rendimiento y accesibilidad. Mi objetivo es ofrecer soluciones tecnológicas de calidad, alineadas con las necesidades del mercado y los objetivos de cada proyecto.";
  String activeButton = "Sobre mí";

  void updateText(String newText, String buttonText) {
    setState(() {
      infoText = newText;
      activeButton = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: _screenWidth,
      height: _screenHeight * 0.7,
      child: VisibilityDetector(
        key: Key('second_view'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: _screenWidth * 0.075),
                      SizedBox(
                        width: _screenWidth * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _screenWidth * 0.3,
                              child: FadeIn(
                                duration: Duration(milliseconds: 1200),
                                child: CircleAvatarWidget(
                                    screenWidth: _screenWidth,
                                    screenHeight: _screenHeight),
                              ),
                            ),
                            SizedBox(height: _screenHeight * 0.02),
                            _CustomButton(
                              text: "Sobre mí",
                              onHover: () => updateText(
                                  "Soy Técnico Superior en Programación y estudiante de la Licenciatura en Informática con amplia experiencia en desarrollo web y móvil, especializado en Flutter y tecnologías modernas. Me apasiona crear interfaces intuitivas, dinámicas y optimizadas para ofrecer experiencias de usuario excepcionales. Mi capacidad de análisis y resolución de problemas me permite desarrollar soluciones eficientes y escalables. Además, mis conocimientos en backend me brindan una visión integral del desarrollo, permitiéndome diseñar arquitecturas sólidas y bien estructuradas. Como freelancer, he trabajado en diversos proyectos, colaborando con clientes para transformar ideas en productos digitales impactantes. Siempre busco innovar y mejorar, aplicando buenas prácticas de desarrollo, optimización del rendimiento y accesibilidad. Mi objetivo es ofrecer soluciones tecnológicas de calidad, alineadas con las necesidades del mercado y los objetivos de cada proyecto.",
                                  "Sobre mí"),
                              isActive: activeButton == "Sobre mí",
                            ),
                            _CustomButton(
                              text: "Mis hobbies",
                              onHover: () => updateText(
                                  "Me gusta programar, leer un buen libro, jugar videojuegos, ir al gimnasio y hacer actividades al aire libre. Además suelo disfrutar de caminatas solitarias, reuniones familiares, jugar con mis hijas y tomar mate o algún refresco con mis amigos más cercanos periodicamente.",
                                  "Mis hobbies"),
                              isActive: activeButton == "Mis hobbies",
                            ),
                            _CustomButton(
                              text: "Voluntariados",
                              onHover: () => updateText(
                                  "Actualmente participo activamente como voluntario en Family Search. A través de una plataforma web, entre otras herramientas móviles, asesoro y asisto a personas que desean armar su árbol genealógico, buscar registros antiguos y crear recuerdos o historias para sus familias.",
                                  "Voluntariados"),
                              isActive: activeButton == "Voluntariados",
                            ),
                            FadeIn(
                              duration: Duration(milliseconds: 1200),
                              child: SizedBox(
                                width: _screenWidth * 0.3,
                                child: Divider(
                                  height: _screenHeight * 0.05,
                                  color: Color(0xff21E6C1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: _screenWidth * 0.075),
                      FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: _screenWidth * 0.5,
                            height: _screenHeight * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Color(0xff21E6C1), width: 2.0)),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      infoText,
                                      style: TextStyle(
                                          fontSize: _screenWidth * 0.014,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Rubik"),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}

class CircleAvatarWidget extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const CircleAvatarWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  _CircleAvatarWidgetState createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> {
  bool isShimmering = true;
  bool isFlipped = false; // Controla si el avatar está volteado o no

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isShimmering = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      //onEnter: (_) => setState(() => _isHovered = true),
      //onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFlipped = !isFlipped; // Cambia el estado de voltear el avatar
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastOutSlowIn,
          width: widget.screenWidth * 0.4,
          height: widget.screenHeight * 0.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isShimmering ? Colors.white : Color(0xff21E6C1),
              width: 3,
            ),
          ),
          child: ClipOval(
            child: Stack(
              children: [
                if (isShimmering)
                  Shimmer.fromColors(
                    period: Duration(milliseconds: 1700),
                    baseColor: Color(0xff21E6C1)!,
                    highlightColor: Colors.indigo.shade400!,
                    child: CircleAvatar(
                      radius: widget.screenWidth * 0.4,
                    ),
                  )
                else
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 1500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return RotationTransition(
                        turns: animation,
                        child: child,
                      );
                    },
                    child: isFlipped
                        ? CircleAvatar(
                            key: ValueKey(1), // Cambia la imagen al voltear
                            radius: widget.screenWidth * 0.4,
                            backgroundImage:
                                AssetImage('assets/img/photos/avatar2.webp'),
                          )
                        : CircleAvatar(
                            key: ValueKey(0), // Imagen original
                            radius: widget.screenWidth * 0.4,
                            backgroundImage:
                                AssetImage('assets/img/photos/avatar.webp'),
                          ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onHover;
  final bool isActive;

  const _CustomButton({
    required this.text,
    required this.onHover,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHover(),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              fontSize: _screenWidth * 0.013,
              fontWeight: FontWeight.w600,
              color: isActive ? Color(0xff21E6C1) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
