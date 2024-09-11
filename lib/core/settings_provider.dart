import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguageCode = 'en';
  ThemeMode currentThemeMode = ThemeMode.dark;
  void changeLanguageCode({required newLanguageCode}) {
    if (currentLanguageCode == newLanguageCode) return;
    currentLanguageCode = newLanguageCode;
    notifyListeners();
  }

  void changeThemeMode({required ThemeMode newThemeMode}) {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }

  String getHomeBackGround() {
    return currentThemeMode == ThemeMode.dark
        ? 'assets/images/home_dark_background.png'
        : 'assets/images/background.png';
  }
}
