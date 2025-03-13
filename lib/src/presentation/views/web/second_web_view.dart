import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:visibility_detector/visibility_detector.dart';

class SecondWebView extends StatefulWidget {
  SecondWebView({super.key});

  @override
  State<SecondWebView> createState() => _SecondWebViewState();
}

class _SecondWebViewState extends State<SecondWebView> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.surface, // Color de fondo dinámico
      width: _screenWidth,
      height: _screenHeight * 0.75,
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
                      Column(
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
                          FadeIn(
                            duration: Duration(milliseconds: 1200),
                            child: Text(
                              'Sobre mí',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: _screenWidth * 0.03,
                                  fontFamily: "Ruik",
                                  fontWeight: FontWeight.bold),
                            ),
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
                          )
                        ],
                      ),
                      SizedBox(
                        width: _screenWidth * 0.075,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: _screenWidth * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Color(0xff21E6C1), width: 2.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Soy Frontend Engineer con amplia experiencia en desarrollo web y móvil, especializado en Flutter y tecnologías modernas. Me apasiona crear interfaces intuitivas, dinámicas y optimizadas para ofrecer experiencias de usuario excepcionales. Mi capacidad de análisis y resolución de problemas me permite desarrollar soluciones eficientes y escalables. Además, mis conocimientos en backend me brindan una visión integral del desarrollo, permitiéndome diseñar arquitecturas sólidas y bien estructuradas. Como freelancer, he trabajado en diversos proyectos, colaborando con clientes para transformar ideas en productos digitales impactantes. Siempre busco innovar y mejorar, aplicando buenas prácticas de desarrollo, optimización del rendimiento y accesibilidad. Mi objetivo es ofrecer soluciones tecnológicas de calidad, alineadas con las necesidades del mercado y los objetivos de cada proyecto.',
                                style: TextStyle(
                                  fontSize: _screenWidth * 0.013,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.justify,
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 1300),
      curve: Curves.fastOutSlowIn,
      width: widget.screenWidth * 0.4, // Tamaño triplicado
      height: widget.screenHeight * 0.4, // Tamaño triplicado
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
                period: Duration(milliseconds: 1500),
                baseColor: Color(0xff21E6C1)!,
                highlightColor: Colors.indigo.shade400!,
                child: CircleAvatar(
                  radius: widget.screenWidth * 0.4, // Tamaño triplicado
                ),
              )
            else
              CircleAvatar(
                radius: widget.screenWidth * 0.4, // Tamaño triplicado
                backgroundImage: AssetImage('assets/img/photos/avatar.webp'),
              ),
          ],
        ),
      ),
    );
  }
}
