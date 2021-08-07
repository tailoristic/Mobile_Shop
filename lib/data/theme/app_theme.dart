import 'package:flutter/material.dart';

class AppTheme {
  static const Color kWhite = Color(0xFFf0f0f4);
  static const kShadowColor = Color(0xFF52555F);
  static const primaryColor = Color(0xFF383d4b);
  static const accentColor = Color(0xFF17CBF8);
  final ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: Color(0xFF373D4D),
    primaryColor: Color(0xFF383d4b),
    accentColor: Color(0xFF17CBF8),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) => Color(0xFF20232b),
      ),
      shadowColor: MaterialStateProperty.resolveWith(
        (states) => Color(0xFF2a2f37),
      ),
    )),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF17CBF8),
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
    ),
  );
}
