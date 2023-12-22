import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeConstants {
  //textColorTheme
  static Color txtColor = AppColors.black;
  static const String appFontFamily = 'Source Sans 3';

  //textTheme
  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appFontFamily,
    ),
    displayMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appFontFamily,
    ),
    displaySmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w300,
      fontFamily: appFontFamily,
    ),
    headlineLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appFontFamily,
    ),
    headlineMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appFontFamily,
    ),
    headlineSmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w400,
      fontFamily: appFontFamily,
    ),
    titleLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appFontFamily,
    ),
    titleMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appFontFamily,
    ),
    titleSmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w300,
      fontFamily: appFontFamily,
    ),
    bodyLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appFontFamily,
    ),
    bodyMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appFontFamily,
    ),
    bodySmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w300,
      fontFamily: appFontFamily,
    ),
    labelLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appFontFamily,
    ),
    labelMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appFontFamily,
    ),
    labelSmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w400,
      fontFamily: appFontFamily,
    ),
  );
}
