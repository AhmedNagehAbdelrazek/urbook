import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/core/constants/constants.dart';

class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: LightColorPalette.white,
    scaffoldBackgroundColor: LightColorPalette.white,
    primaryColorLight: LightColorPalette.cyan50,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: LightColorPalette.black, width: 1),
        backgroundColor: LightColorPalette.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColorPalette.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      labelStyle: const TextStyle(
          fontFamily: Constants.fontName, color: LightColorPalette.black),
      hintStyle: const TextStyle(
          fontFamily: Constants.fontName, color: LightColorPalette.black),
      hoverColor: LightColorPalette.cyan,
      fillColor: LightColorPalette.cyan,
      focusColor: LightColorPalette.cyan,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: LightColorPalette.cyan, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: LightColorPalette.cyan, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: BaseColorPalette.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: BaseColorPalette.red, width: 3.0),
      ),
    ),
    textTheme:  TextTheme(
      titleLarge: TextStyle(
          fontSize: 24.sp,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.bold,
          color: LightColorPalette.black),
      bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w500,
          color: LightColorPalette.black),
      bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w500,
          color: LightColorPalette.black),
      bodySmall: TextStyle(
          fontSize: 12.sp,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w600,
          color: LightColorPalette.black),
    ),
  );
  static ThemeData darkThemeData = ThemeData();
}
