import 'package:flutter/material.dart';
import 'package:foodito/config/utils/colors.dart';
import 'package:foodito/config/utils/fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      // * Brightness
      brightness: Brightness.light,

      // * Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.secondaryColor1,
        primaryContainer: AppColors.secondaryColor2,
        onPrimaryContainer: AppColors.secondaryColor3,
        background: Colors.white,
        shadow: AppColors.shadeColor,
      ),

      // * Scaffold
      scaffoldBackgroundColor: Colors.white.withOpacity(0.95),

      // * App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
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
        headlineMedium: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
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
    return ThemeData(
      // * Brightness
      brightness: Brightness.dark,

      // * Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.secondaryColor1,
        primaryContainer: AppColors.secondaryColor2,
        onPrimaryContainer: AppColors.secondaryColor3,
        background: Colors.black,
        shadow: AppColors.shadeColor,
      ),

      // * Scaffold

      // * App Bar

      // * Elevated Button

      // * Bottom Navigation Bar

      // * Text

      // * Font
      fontFamily: AppFonts.sfProDisplay,
    );
  }
}
