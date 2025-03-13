import 'package:flutter/material.dart';
import 'package:portafolio_new_fl/src/config/themes/app_theme.dart';
import 'package:portafolio_new_fl/src/core/shared/theme_preference_shared.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.darkTheme; // Default dark mode

  ThemesProvider() {
    loadTheme();
  }

  void loadTheme() async {
    await ThemeSharedPreference.init();
    bool isDark = ThemeSharedPreference.isDarkmode;
    currentTheme = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }

  void toggleTheme() {
    if (currentTheme == AppTheme.darkTheme) {
      setLightMode();
    } else {
      setDarkMode();
    }
  }

  void setLightMode() {
    currentTheme = AppTheme.lightTheme;
    ThemeSharedPreference.setDarkmode(false);
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = AppTheme.darkTheme;
    ThemeSharedPreference.setDarkmode(true);
    notifyListeners();
  }
}
