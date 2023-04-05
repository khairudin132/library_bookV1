import 'package:flutter/material.dart';

class OurTheme {
  final Color _lightGreen = const Color.fromARGB(255, 213, 235, 220);
  final Color _lightGrey = const Color.fromARGB(255, 164, 164, 164);
  final Color _darkerGrey = const Color.fromARGB(255, 119, 124, 135);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: Colors.white,
      primaryColor: Colors.green,
      secondaryHeaderColor: _darkerGrey,
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: _lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: _lightGreen,
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: _darkerGrey,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        minWidth: 150,
        height: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _lightGrey),
    );
  }
}
