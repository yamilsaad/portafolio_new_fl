import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterWebView extends StatelessWidget {
  const FooterWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.35;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Links y Redes Sociales
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo y Descripción
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Front End Engineer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: screenWidth * 0.3,
                    child: Text(
                      "Soluciones tecnológicas innovadoras para potenciar su negocio.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),

              // Enlaces rápidos
              Row(
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
              ),

              // Redes Sociales
              Row(
                children: [
                  _socialIcon(FontAwesomeIcons.facebook),
                  _socialIcon(FontAwesomeIcons.xTwitter),
                  _socialIcon(FontAwesomeIcons.linkedin),
                  _socialIcon(FontAwesomeIcons.instagram),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Línea divisoria y Derechos
          Divider(color: Colors.white38),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "© 2025 Soy-Dev. Todos los derechos reservados.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
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

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
