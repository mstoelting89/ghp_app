import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimaryColor = Color(0xFFa21d21);
  static const Color _lightSecondaryColor = Colors.black54;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _lightTextColorSecondary = Colors.white;
  static const Color _appbarColorLight = Color(0xFFa21d21);

  static const Color _iconColor = Colors.white;

  static const TextStyle _lightHeadingPrimaryText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Merriweather",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightHeadingSecondaryText = TextStyle(
      color: _lightTextColorSecondary,
      fontFamily: "Merriweather",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightButtonTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      letterSpacing: 4);

  static const TextStyle _lightBodyPrimaryText = TextStyle(
      color: _lightTextColorPrimary, fontFamily: "Merriweather", fontSize: 16);

  static const TextStyle _lightBodySecondaryText = TextStyle(
      color: _lightTextColorSecondary,
      fontFamily: "Merriweather",
      fontSize: 16);

  static const TextTheme _lightTextTheme = TextTheme(
      headline1: _lightHeadingPrimaryText,
      headline2: _lightHeadingSecondaryText,
      bodyText1: _lightBodyPrimaryText,
      bodyText2: _lightBodySecondaryText,
      button: _lightButtonTextStyle,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    ),
    labelStyle: const TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
      inputDecorationTheme: _inputDecorationTheme,
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: _iconColor)),
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        secondary: _lightSecondaryColor,
      ),
      textTheme: _lightTextTheme,
  );
}
