import 'package:flutter/material.dart';

class LightingPainter extends CustomPainter {
  final Offset mousePosition;
  final ThemeData theme;

  LightingPainter(this.mousePosition, this.theme);

  @override
  void paint(Canvas canvas, Size size) {
    // Si el tema es claro, no dibujamos el efecto de iluminación
    if (theme.brightness == Brightness.light) {
      return;
    }

    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.blue.withOpacity(0.3),
          Colors.transparent,
        ],
        stops: [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(center: mousePosition, radius: 200),
      );

    canvas.drawCircle(mousePosition, 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
