import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienciaMobileWidget extends StatefulWidget {
  ExperienciaMobileWidget({super.key});

  @override
  State<ExperienciaMobileWidget> createState() =>
      _ExperienciaMobileWidgetState();
}

class _ExperienciaMobileWidgetState extends State<ExperienciaMobileWidget> {
  bool _isVisible = false;
  final List<Map<String, dynamic>> scrumSteps = [
    {
      "title": "Desarrollador de Software",
      "description": "2024 - 2025 / Desarrollador de Software Freelancer.",
      "icon": Icons.code,
    },
    {
      "title": "Desarrollador de Aplicaciones Móviles Front End",
      "description":
          "2023 - 2024 / San Francisco Hogar / Desarrollo de aplicaciones móviles, sistema web y planificación con métodos ágiles.",
      "icon": Icons.app_settings_alt_outlined,
    },
    {
      "title": "Programador, diseñador y Data Entry",
      "description":
          "2021 - 2023 / Colaboración en proyectos desarrollados con WordPress, Odoo, Flutter, entre otros.",
      "icon": Icons.desktop_windows_outlined,
    },
    {
      "title": "Encargado de sucursal comercial",
      "description":
          "2017 - 2022 / Ferretería Santo Tomás / Administrador de sistema, ventas, compras, pagos y planificación para todas las sucursales.",
      "icon": Icons.group_work_outlined,
    },
    {
      "title": "Vendedor - Cajero",
      "description":
          "2014 - 2016 / Power Bike SRL /Venta de bicicletas y repuestos de competición. Cajero",
      "icon": Icons.point_of_sale_sharp,
    },
    {
      "title": "Atención al público",
      "description":
          "2011 - 2014 / Atención al público en negocios gastronómicos.",
      "icon": Icons.food_bank,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return VisibilityDetector(
      key: Key('scrum_mobile'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: _isVisible
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        "Mi experiencia laboral",
                        style: TextStyle(
                            fontSize: _screenWidth * 0.085,
                            fontFamily: "Ruik",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: SizedBox(
                        width: _screenWidth * 0.75,
                        child: Divider(
                          height: _screenHeight * 0.05,
                          color: Color(0xff21E6C1),
                        ),
                      ),
                    ),
                    SizedBox(height: _screenHeight * 0.025),
                    FadeIn(
                      duration: const Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _screenWidth * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: scrumSteps.map((step) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 3.0,
                                          child: Icon(step["icon"],
                                              size: _screenWidth * 0.075,
                                              color: Color(0xff21E6C1)),
                                        ),
                                        Container(
                                          width: _screenWidth * 0.0075,
                                          height: _screenHeight * 0.075,
                                          color: Colors.teal.withOpacity(0.6),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: _screenWidth * 0.01),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              step["title"],
                                              style: TextStyle(
                                                fontSize: _screenWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Rubik',
                                              ),
                                            ),
                                            Text(
                                              step["description"],
                                              style: TextStyle(
                                                fontSize: _screenWidth * 0.035,
                                                color: Color(0xff21E6C1),
                                              ),
                                            ),
                                            SizedBox(
                                                height: _screenHeight * 0.015),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: _screenWidth * 0.05,
                          ),
                        ],
                      ),
                    ),
                    /*SizedBox(
                        height: _screenHeight * 0.2,
                        width: _screenWidth * 0.9,
                        child: CarruselDesktopWidget())*/
                  ],
                ),
              ],
            )
          : Container(
              height: _screenHeight * 0.075,
              width: _screenWidth * 0.075,
            ),
    );
  }
}
