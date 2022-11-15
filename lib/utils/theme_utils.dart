import 'package:flutter/material.dart';

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
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(10),
      textColor: MunchScheme.lightColorScheme.onBackground,
      iconColor: MunchScheme.lightColorScheme.onBackground,
    ),
    fontFamily: 'Quicksand',
    drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent),
    canvasColor: MunchColors.primaryLight,
    radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(MunchColors.primaryColor)),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: MunchColors.primaryDark),
        backgroundColor: MunchColors.primaryLight),
    inputDecorationTheme:
        const InputDecorationTheme(border: OutlineInputBorder()),
    scaffoldBackgroundColor: MunchScheme.lightColorScheme.background,
    chipTheme: const ChipThemeData(
        checkmarkColor: MunchColors.transparent,
        iconTheme: IconThemeData(size: 0)),
    colorScheme: MunchScheme.lightColorScheme,
  );
  static final darkTheme = ThemeData(
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(10),
      textColor: MunchScheme.darkColorScheme.onBackground,
      iconColor: MunchScheme.darkColorScheme.onBackground,
    ),
    fontFamily: 'Quicksand',
    drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent),
    canvasColor: MunchColors.primaryDark,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: MunchColors.primaryLight),
        backgroundColor: MunchColors.primaryDark),
    radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(MunchColors.primaryColor)),
    inputDecorationTheme:
        const InputDecorationTheme(border: OutlineInputBorder()),
    chipTheme: const ChipThemeData(
      checkmarkColor: MunchColors.transparent,
    ),
    scaffoldBackgroundColor: MunchScheme.darkColorScheme.background,
    colorScheme: MunchScheme.darkColorScheme,
  );
}
