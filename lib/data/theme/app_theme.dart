import 'package:flutter/material.dart';

class AppTheme {
  static const Color kWhite = Color(0xFFf0f0f4);
  final ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: Color(0xFF383d4b),
    primaryColor: Color(0xFF383d4b),
    accentColor: Color(0xFFad4b69),
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
        color: Color(0xFFad4b69),
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
    ),
  );
}
