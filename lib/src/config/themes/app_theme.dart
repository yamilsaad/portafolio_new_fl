import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "SpaceGrotesk",
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xff21E6C1),
        surface: Color(0xff4D55CC), // Fondo para el tema claro
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff7A73D1),
          iconTheme: IconThemeData(
            color: Color(0xff21E6C1),
          )));
  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "SpaceGrotesk",
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xff17153B),
        brightness: Brightness.dark,
        surface: Color(0xff17153B), // Fondo para el tema oscuro
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff2E236C),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff17153B),
      ));
}
