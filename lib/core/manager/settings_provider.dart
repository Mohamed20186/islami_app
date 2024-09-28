import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguageCode = 'en';
  ThemeMode currentThemeMode = ThemeMode.dark;
  void changeLanguageCode({required newLanguageCode}) async {
    if (currentLanguageCode == newLanguageCode) return;
    currentLanguageCode = newLanguageCode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', currentLanguageCode);
    notifyListeners();
  }

  void changeThemeMode({required ThemeMode newThemeMode}) async {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', currentThemeMode.name);
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

  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString('language');
    lang ??= 'en';
    currentLanguageCode = lang;
    String? theme = prefs.getString('theme');
    currentThemeMode = (theme == 'dark' ? ThemeMode.dark : ThemeMode.light);
  }
}
