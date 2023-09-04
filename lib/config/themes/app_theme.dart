import 'package:flutter/material.dart';
import 'package:lap_quest/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static const lTextTheme = TextTheme(
    headlineMedium: TextStyle(
        color: AppColors.lPrimaryColor,
        fontSize: 48.0,
        fontWeight: FontWeight.bold),
    titleMedium:
        TextStyle(color: AppColors.lPrimaryLighterShade, fontSize: 18.0),
  );

//*Black Ops One
//*Obitron
//*Tektur
//* Frijone

//*Solway

  static get lightTheme {
    return ThemeData(
      primaryColor: AppColors.lPrimaryDarkerShade,
      highlightColor: AppColors.lPrimaryColor.withOpacity(0.1),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lPrimaryColor),
      textTheme: GoogleFonts.solwayTextTheme(lTextTheme).copyWith(
        headlineMedium:
            GoogleFonts.orbitron(textStyle: lTextTheme.headlineMedium),
      ),
      snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.lPrimaryLighterShade),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const dTextTheme = TextTheme(
    headlineMedium: TextStyle(
        color: AppColors.dPrimaryColor,
        fontSize: 48.0,
        fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: AppColors.dPrimaryColor, fontSize: 18.0),
  );

  static get darkTheme => ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.dPrimaryDarkerShade),
        primaryColor: AppColors.dPrimaryDarkerShade,
        highlightColor: Colors.lightGreen.withOpacity(0.1),
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: AppColors.dPrimaryColor),
        textTheme: GoogleFonts.solwayTextTheme(dTextTheme).copyWith(
          headlineMedium:
              GoogleFonts.orbitron(textStyle: dTextTheme.headlineMedium),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
        snackBarTheme: const SnackBarThemeData(
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.dPrimaryLighterShade),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
