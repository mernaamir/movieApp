import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.main,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appbarDark
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 22,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal),
      titleMedium: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 13,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal),
      bodySmall: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal),
    ),
  );
}
