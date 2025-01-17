import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import '../custom_colors/custom_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    // textTheme: TextTheme(labelLarge: KText.r20Bold),
    fontFamily: GoogleFonts.roboto(color: CustomColors.black).fontFamily,
    primarySwatch: generateMaterialColor(Palette.primary),
    inputDecorationTheme:
        const InputDecorationTheme(focusColor: CustomColors.black),
    scaffoldBackgroundColor: CustomColors.white,
    cardColor: CustomColors.white,
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(backgroundColor: CustomColors.white),
    splashColor: CustomColors.white,
  );
  static ThemeData dark = ThemeData(
    fontFamily: GoogleFonts.roboto(color: CustomColors.black).fontFamily,
    primarySwatch: generateMaterialColor(DarkPalette.primary),
    inputDecorationTheme:
        const InputDecorationTheme(focusColor: CustomColors.black),
    scaffoldBackgroundColor: CustomColors.black,
    cardColor: CustomColors.black,
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(backgroundColor: CustomColors.black),
    splashColor: CustomColors.black,
  );
}

class Palette {
  static Color primary = CustomColors.darkPurple;
}

class DarkPalette {
  static const Color primary = CustomColors.black;
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
