import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MunchColors {
  static const primaryColor = Color(0xFF2EE884);
  static const primaryLight = Color(0xFFFFFCFC);
  static const primaryDark = Color(0xFF262626);
  static const primaryGray = Color(0xFF808080);
  static const primaryError = Color(0xFFFF4444);
  static const transparent = Color(0x00FCCCCC);
}

class MunchScheme {
  // TODO: *FOR KEVIN* Figure out if this can be optimized. Currently increasing bundle size but there might be a way to extract the commanalities and bring them in later without sacrificing const benifits?
  static const lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: MunchColors.primaryColor,
      onPrimary: MunchColors.primaryLight,
      secondary: MunchColors.primaryColor,
      onSecondary: MunchColors.primaryLight,
      error: MunchColors.primaryError,
      onError: MunchColors.primaryLight,
      background: MunchColors.primaryLight,
      onBackground: MunchColors.primaryDark,
      surface: MunchColors.primaryLight,
      onSurface: MunchColors.primaryDark);
  static const darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: MunchColors.primaryColor,
      onPrimary: MunchColors.primaryLight,
      secondary: MunchColors.primaryColor,
      onSecondary: MunchColors.primaryLight,
      error: MunchColors.primaryError,
      onError: MunchColors.primaryLight,
      background: MunchColors.primaryDark,
      onBackground: MunchColors.primaryLight,
      surface: MunchColors.primaryDark,
      onSurface: MunchColors.primaryLight);
}

class MunchTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
    scaffoldBackgroundColor: MunchScheme.lightColorScheme.background,
    chipTheme: const ChipThemeData(checkmarkColor: MunchColors.primaryDark),
    colorScheme: MunchScheme.lightColorScheme,
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
    chipTheme: const ChipThemeData(checkmarkColor: MunchColors.primaryDark),
    scaffoldBackgroundColor: MunchScheme.darkColorScheme.background,
    colorScheme: MunchScheme.darkColorScheme,
  );
}
