import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode currentMode = ThemeMode.light;
  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? isDark = prefs.getBool('isDark');
    if (isDark != null) {
      if (isDark) {
        currentMode = ThemeMode.dark;
      } else {
        (currentMode = ThemeMode.light);
      }
      notifyListeners();
    }
  }

  changeTheme(ThemeMode mode) async {
    currentMode = mode;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', mode == ThemeMode.dark);

    notifyListeners();
  }
}
