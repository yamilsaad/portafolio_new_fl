import 'package:flutter/material.dart';

import '../../widgets/web/widget.dart';

class ExperienciaWebView extends StatelessWidget {
  const ExperienciaWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight * 1.75,
      width: _screenWidth,
      child: ExperienciaWebWidget(),
    );
  }
}
