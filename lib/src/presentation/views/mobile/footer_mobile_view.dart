import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterMobileView extends StatelessWidget {
  const FooterMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.35;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Links y Redes Sociales
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Front End Engineer",
                    style: TextStyle(
                      color: Color(0xff21E6C1),
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(
                height: screenHeight * 0.01,
                color: Color(0xff21E6C1),
              ),
              SizedBox(height: screenHeight * 0.01),
              // Logo y Descripción
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: Text(
                      "Soluciones tecnológicas innovadoras para potenciar su negocio.",
                      style: TextStyle(
                          color: Colors.white70, fontSize: screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  // Redes Sociales
                ],
              ),

              // Enlaces rápidos
              /* Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _footerLink("¿Tienes una propuesta?"),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  _footerLink("Presupuesto"),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  _footerLink("Asesoramiento"),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  _footerLink("Desing UX/UI"),
                ],
              ),*/
            ],
          ),
          SizedBox(height: screenHeight * 0.025),
          // Línea divisoria y Derechos
          Divider(color: Colors.white38),
          SizedBox(height: screenHeight * 0.015),
          Center(
            child: Text(
              textAlign: TextAlign.left,
              "© 2025 - Sitio diseñado y desarrollado por Yamil Saad.",
              style: TextStyle(
                  color: Colors.white70, fontSize: screenWidth * 0.035),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
