import 'package:flutter/material.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/core/utils/assets_manager/assets_constant.dart';

class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: LightColorPalette.white,
    primaryColorLight:LightColorPalette.cyan50 ,
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColorPalette.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          fontFamily: AssetsConstant.fontName,
          fontWeight: FontWeight.bold,
          color: LightColorPalette.black),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: AssetsConstant.fontName,
          fontWeight: FontWeight.w500,
          color: LightColorPalette.black),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontFamily: AssetsConstant.fontName,
          fontWeight: FontWeight.w500,
          color: LightColorPalette.black),
      bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: AssetsConstant.fontName,
          fontWeight: FontWeight.w600,
          color: LightColorPalette.black),
    ),
  );
  static ThemeData darkThemeData = ThemeData();
}
