import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xffB7935F);
  static const Color primaryDarkColor = Color(0xFFFACC1D);
  static ThemeData lightThemeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'El Messiri',
      ),
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: primaryColor,
      space: 10,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      selectedItemColor: Color(0xFF222222),
      selectedIconTheme: IconThemeData(
        size: 35,
        color: Color(0xFF222222),
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'El Messiri',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'El Messiri',
      ),
      unselectedItemColor: Color(0xFFF8F8F8),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Color(0xFFF8F8F8),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'El Messiri',
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'El Messiri',
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: 'El Messiri',
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: 'El Messiri',
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: 'El Messiri',
      ),
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'El Messiri',
      ),
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: primaryDarkColor,
    ),
    dividerTheme: const DividerThemeData(
      color: primaryDarkColor,
      space: 10,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff141A2E),
      selectedItemColor: primaryDarkColor,
      selectedIconTheme: IconThemeData(
        size: 35,
        color: primaryDarkColor,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'El Messiri',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'El Messiri',
      ),
      unselectedItemColor: Color(0xFFF8F8F8),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Color(0xFFF8F8F8),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'El Messiri',
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'El Messiri',
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'El Messiri',
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'El Messiri',
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: 'El Messiri',
      ),
    ),
  );
}
