
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode;
  get getTheme => _themeMode;

  ThemeProvider() {
    fetchInitialTheme();
  }
  void fetchInitialTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool("isDarkMode");
    if (isDarkMode != null) {
      updateThemeModeFromSharedPrefs(isDarkMode);
    }
  }


  void toggleThemeMode() async {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkMode", _themeMode == ThemeMode.dark);
    notifyListeners();
  }

  void updateThemeModeFromSharedPrefs(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
