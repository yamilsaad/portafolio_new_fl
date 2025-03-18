import 'package:flutter/material.dart';

import '../../widgets/mobile/widget.dart';

class ExperienciaMobileView extends StatelessWidget {
  const ExperienciaMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight * 1.1,
      width: _screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ExperienciaMobileWidget(),
      ),
    );
  }
}
