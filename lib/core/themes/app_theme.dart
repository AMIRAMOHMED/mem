import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(10));

  static final darkTthemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.white),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.skyBlue),
    ),
  );
}
