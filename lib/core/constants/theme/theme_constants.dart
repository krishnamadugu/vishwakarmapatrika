import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeConstants {
  //textColorTheme
  static Color txtColor = AppColors.black;
  static const String appFontFamily = 'Source Sans 3';

  //inputDecorationTheme
  static const inputDecorationTheme = InputDecorationTheme(
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
  );

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

  static const timePickerTheme = TimePickerThemeData(
      // backgroundColor: Colors.blueGrey,
      // hourMinuteShape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(8)),
      //   side: BorderSide(color: Colors.orange, width: 4),
      // ),
      // dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
      // dayPeriodColor: Colors.blueGrey.shade600,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(8)),
      //   side: BorderSide(color: Colors.orange, width: 4),
      // ),
      // dayPeriodTextColor: Colors.white,
      // dayPeriodShape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(8)),
      //   side: BorderSide(color: Colors.orange, width: 4),
      // ),
      // hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      //     states.contains(MaterialState.selected)
      //         ? Colors.orange
      //         : Colors.blueGrey.shade800),
      // hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
      //     states.contains(MaterialState.selected) ? Colors.white : Colors.orange),
      // dialHandColor: Colors.blueGrey.shade700,
      // dialBackgroundColor: Colors.blueGrey.shade800,
      // hourMinuteTextStyle:
      //     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      // dayPeriodTextStyle:
      //     const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      // helpTextStyle: const TextStyle(
      //     fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      // inputDecorationTheme: const InputDecorationTheme(
      //   border: InputBorder.none,
      //   contentPadding: EdgeInsets.all(0),
      // ),
      // dialTextColor: MaterialStateColor.resolveWith((states) =>
      //     states.contains(MaterialState.selected) ? Colors.orange : Colors.white),
      // entryModeIconColor: Colors.orange,
      );
}
