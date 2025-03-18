import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/mobile/widget.dart';
import '../../widgets/web/widget.dart';

class ThirdMobileView extends StatefulWidget {
  const ThirdMobileView({super.key});

  @override
  State<ThirdMobileView> createState() => _ThirdMobileViewState();
}

class _ThirdMobileViewState extends State<ThirdMobileView> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: _screenHeight * 1.8,
      width: _screenWidth,
      child: VisibilityDetector(
        key: Key('third_view_mobile'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Text(
                            'Mis trabajos',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: _screenWidth * 0.085,
                                fontFamily: "Ruik",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            color: Color(0xff21E6C1),
                            width: _screenWidth * 0.65,
                            child: Text(
                              'Proyectos terminados',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff433D8B),
                                  fontSize: _screenWidth * 0.055,
                                  fontFamily: "Ruik",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(height: _screenHeight * 0.025),
                        TerminadosMobileWidget(
                            screenWidth: _screenWidth,
                            screenHeight: _screenHeight)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: _screenHeight * 0.025),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Text(
                            'Mis colaboraciones',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: _screenWidth * 0.085,
                                fontFamily: "Ruik",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            color: Color(0xff21E6C1),
                            width: _screenWidth * 0.65,
                            child: Text(
                              'Empresas',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff433D8B),
                                  fontSize: _screenWidth * 0.055,
                                  fontFamily: "Ruik",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(height: _screenHeight * 0.025),
                        ColaboracionesMobileWidget(
                            screenWidth: _screenWidth,
                            screenHeight: _screenHeight)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: _screenHeight * 0.025),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Text(
                            'Actualidad',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: _screenWidth * 0.085,
                                fontFamily: "Ruik",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            color: Color(0xff21E6C1),
                            width: _screenWidth * 0.65,
                            child: Text(
                              'Proyectos en proceso',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff433D8B),
                                  fontSize: _screenWidth * 0.055,
                                  fontFamily: "Ruik",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(height: _screenHeight * 0.025),
                        EnquestoyMobileWidget(
                            screenWidth: _screenWidth,
                            screenHeight: _screenHeight)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: _screenHeight * 0.025),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Text(
                            'Diseño',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: _screenWidth * 0.085,
                                fontFamily: "Ruik",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            color: Color(0xff21E6C1),
                            width: _screenWidth * 0.65,
                            child: Text(
                              'Logo y Marca - UI y UX',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff433D8B),
                                  fontSize: _screenWidth * 0.055,
                                  fontFamily: "Ruik",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(height: _screenHeight * 0.025),
                        DiseniosMobileWidget(
                            screenWidth: _screenWidth,
                            screenHeight: _screenHeight)
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
