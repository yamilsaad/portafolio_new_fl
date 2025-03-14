import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ColaboracionesWebWidget extends StatelessWidget {
  const ColaboracionesWebWidget({
    super.key,
    required double screenWidth,
    required double screenHeight,
  })  : _screenWidth = screenWidth,
        _screenHeight = screenHeight;

  final double _screenWidth;
  final double _screenHeight;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return FadeIn(
      duration: const Duration(milliseconds: 1200),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HoverableCard2(
                  title: 'San Francisco Hogar - Sistemas',
                  imageUrl: 'assets/img/photos/banner_portafolio3.webp',
                  screenWidth: _screenWidth,
                  screenHeight: _screenHeight,
                  subtitle:
                      'Desarrollo de Aplicación Móvil para el registro de nuevos clientes y aspirantes crediticios. Desarrollo de Sistema Web para créditos en Flask Python.',
                  alertUrl: 'assets/img/photos/banner_portafolio7.webp',
                ),
                _HoverableCard(
                  title: 'WordPress M y B Hogar',
                  imageUrl: 'assets/img/photos/banner_portafolio8.webp',
                  url: 'https://maxibrant.com/',
                  screenWidth: _screenWidth,
                  screenHeight: _screenHeight,
                ),
                SizedBox(
                  width: _screenWidth * 0.25,
                  height: _screenHeight * 0.25,
                ),
                SizedBox(
                  width: _screenWidth * 0.25,
                  height: _screenHeight * 0.25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverableCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String url;
  final double screenWidth;
  final double screenHeight;

  const _HoverableCard({
    required this.title,
    required this.imageUrl,
    required this.url,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  _HoverableCardState createState() => _HoverableCardState();
}

class _HoverableCardState extends State<_HoverableCard> {
  bool isHovered = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => _launchURL(widget.url),
        child: Card(
          elevation: 5.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: widget.screenWidth * 0.25,
            height: widget.screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: widget.screenWidth * 0.25,
                    height: widget.screenHeight * 0.25,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.screenWidth * 0.25,
                  height: widget.screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isHovered ? Colors.black87 : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _screenWidth * 0.016,
                      fontWeight: FontWeight.bold,
                      color: isHovered ? Colors.white : Colors.transparent,
                    ),
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

class _HoverableCard2 extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String alertUrl; // Imagen en el AlertDialog
  final double screenWidth;
  final double screenHeight;

  const _HoverableCard2({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.screenWidth,
    required this.screenHeight,
    required this.alertUrl,
  });

  @override
  _HoverableCard2State createState() => _HoverableCard2State();
}

class _HoverableCard2State extends State<_HoverableCard2> {
  bool _isHovered = false;

  void _showImageDialog() {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.alertUrl,
                fit: BoxFit.cover,
                width: _screenWidth * 0.75,
                height: _screenHeight * 0.65,
              ),
              SizedBox(height: _screenHeight * 0.015),
              SizedBox(
                width: _screenWidth * 0.4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(widget.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _showImageDialog,
        child: Card(
          elevation: 5.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: widget.screenWidth * 0.25,
            height: widget.screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: widget.screenWidth * 0.25,
                    height: widget.screenHeight * 0.25,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.screenWidth * 0.25,
                  height: widget.screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _isHovered ? Colors.black87 : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.016,
                        fontWeight: FontWeight.bold,
                        color: _isHovered ? Colors.white : Colors.transparent,
                      ),
                    ),
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
