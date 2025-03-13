import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_new_fl/src/config/themes/app_theme.dart';
import 'package:portafolio_new_fl/src/data/providers/theme_provider.dart';

class ThemeswitchWebComponent extends StatelessWidget {
  const ThemeswitchWebComponent({
    super.key,
    required this.themeProvider,
  });

  final ThemesProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return AnimatedToggleSwitch<bool>.dual(
      current: themeProvider.currentTheme == AppTheme.darkTheme,
      first: false,
      second: true,
      spacing: _screenWidth * 0.01,
      borderWidth: 2.0,
      height: _screenHeight * 0.05,
      indicatorSize: Size(_screenWidth * 0.03, _screenWidth * 0.045),
      onChanged: (value) => themeProvider.toggleTheme(),
      iconBuilder: (value) => value
          ? FaIcon(
              FontAwesomeIcons.moon,
              color: Color(0xff17153B),
            )
          : FaIcon(FontAwesomeIcons.sun, color: Color(0xff21E6C1)),
      style: ToggleStyle(
        //borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xff17153B),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
    );
  }
}
