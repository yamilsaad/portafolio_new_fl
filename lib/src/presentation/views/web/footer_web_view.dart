import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWebView extends StatelessWidget {
  const FooterWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.3;
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
                      color: Color(0xff21E6C1),
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

              // Redes Sociales
              Row(
                children: [
                  //_socialIcon(FontAwesomeIcons.facebook, screenWidth),
                  //_socialIcon(FontAwesomeIcons.xTwitter, screenWidth),
                  _socialIcon(FontAwesomeIcons.linkedin, screenWidth,
                      "https://www.linkedin.com/in/yamilsaad/"),
                  _socialIcon(FontAwesomeIcons.instagram, screenWidth,
                      "https://www.instagram.com/saad_yamil/"),
                  _socialIcon(FontAwesomeIcons.github, screenWidth,
                      "https://github.com/yamilsaad"),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.025),
          // Línea divisoria y Derechos
          Divider(color: Colors.white38),
          SizedBox(height: screenHeight * 0.015),
          Center(
            child: Text(
              "© 2025 - Sitio diseñado y desarrollado por Yamil Saad.",
              style: TextStyle(
                  color: Colors.white70, fontSize: screenWidth * 0.014),
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
              screenWidth * 0.02, // Ajusta el tamaño del ícono en base al ancho
        ),
      ),
    );
  }
}
