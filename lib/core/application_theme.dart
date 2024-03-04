import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF093923),
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        color: Color(0xFFB7B7B7),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: Color(0xFF093923),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF093923),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black, size: 32),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 130,
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white,
      thickness: 2.2,
      endIndent: 8,
      indent: 8,
    ),
  );
}
