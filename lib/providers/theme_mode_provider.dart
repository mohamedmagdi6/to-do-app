import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode currentMode = ThemeMode.light;

  changeTheme(ThemeMode mode) {
    currentMode = mode;
    notifyListeners();
  }
}
