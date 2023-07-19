import 'package:flutter/material.dart';
import 'package:foodito/config/utils/colors.dart';
import 'package:foodito/config/utils/fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,

      // * App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      // * Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          shadowColor: AppColors.shadeColor,
          elevation: 10,
        ),
      ),

      // * Text
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ),
      ),

      // * Font
      fontFamily: AppFonts.sfProDisplay,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData();
  }
}
