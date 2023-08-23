import 'package:flutter/material.dart';
import 'package:lap_quest/core/constants/colors.dart';

class AppTheme {
  const AppTheme._();

  static const lTextTheme = TextTheme(
    headlineMedium: TextStyle(
        color: AppColors.lPrimaryColor,
        fontSize: 64.0,
        fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: AppColors.lPrimaryColor, fontSize: 18.0),
  );

  static const dTextTheme = TextTheme(
    headlineMedium: TextStyle(
        color: AppColors.dPrimaryColor,
        fontSize: 64.0,
        fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: AppColors.dPrimaryColor, fontSize: 18.0),
  );

  static get lightTheme {
    return ThemeData(
      primaryColor: AppColors.lPrimaryDarkerShade,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lPrimaryColor),
      textTheme: lTextTheme,
      snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.lPrimaryLighterShade),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static get darkTheme => ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColors.dPrimaryDarkerShade,
        ),
        primaryColor: AppColors.dPrimaryDarkerShade,
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: AppColors.dPrimaryColor),
        textTheme: dTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
        snackBarTheme: SnackBarThemeData(
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.dPrimaryLighterShade),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
