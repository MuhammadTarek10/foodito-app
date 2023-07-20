import 'package:flutter/material.dart';
import 'package:foodito/config/utils/colors.dart';
import 'package:foodito/config/utils/fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,

      // * Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor1,
        background: Colors.white,
      ),

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

      // * Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor2,
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
