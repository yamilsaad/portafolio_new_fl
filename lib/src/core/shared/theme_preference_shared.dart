import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreference {
  static late SharedPreferences _preferences;

  static const _keyIsDarkmode = 'isDarkmode';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setDarkmode(bool isDarkmode) async {
    await _preferences.setBool(_keyIsDarkmode, isDarkmode);
  }

  static bool get isDarkmode {
    return _preferences.getBool(_keyIsDarkmode) ??
        true; // Default to true for dark mode
  }
}
