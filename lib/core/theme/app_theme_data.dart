import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
    ),
  );
  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: AppColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
