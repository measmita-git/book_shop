import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';


class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  // Getter for themeData
  ThemeData get themeData => _themeData;

  // Getter for isDarkMode
  bool get isDarkMode => _themeData == darkMode;

  // Setter for themeData
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Method to toggle the theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
