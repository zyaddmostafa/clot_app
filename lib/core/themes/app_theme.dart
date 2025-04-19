// filepath: d:\my flutter projects\clot_app\lib\core\themes\app_theme.dart
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    // Customize text style to use black text
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
    // Customize the input field style
    cardColor: AppColors.secondaryColorLightMode,
    hintColor: AppColors.hintTextColorLightMode,
    iconTheme: const IconThemeData(color: Colors.black),
  );

  // Dark Theme
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    primaryColor: Colors.white,
    // Customize text style to use white text
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: AppColors.hintTextColorDarkMode),
      titleSmall: TextStyle(color: AppColors.hintTextColorDarkMode),
      titleLarge: TextStyle(color: AppColors.hintTextColorDarkMode),
    ),
    // hintColor: AppColors.hintTextColorDarkMode,
    iconTheme: const IconThemeData(color: Colors.white),

    cardColor: AppColors.secondaryColorDarkMode,
  );
}
