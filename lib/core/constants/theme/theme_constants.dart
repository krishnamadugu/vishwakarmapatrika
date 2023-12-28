import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeConstants {
  //textColorTheme
  static Color txtColor = AppColors.black;
  static const String appSourceFontFamily = 'Source Sans 3';
  static const String appLobsterTwoFontFamily = 'Lobster Two';

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
      fontFamily: appSourceFontFamily,
    ),
    displayMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appSourceFontFamily,
    ),
    displaySmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w300,
      fontFamily: appSourceFontFamily,
    ),
    headlineLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appSourceFontFamily,
    ),
    headlineMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appSourceFontFamily,
    ),
    headlineSmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w400,
      fontFamily: appSourceFontFamily,
    ),
    titleLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appSourceFontFamily,
    ),
    titleMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appSourceFontFamily,
    ),
    titleSmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w300,
      fontFamily: appSourceFontFamily,
    ),
    bodyLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appSourceFontFamily,
    ),
    bodyMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appSourceFontFamily,
    ),
    bodySmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w300,
      fontFamily: appSourceFontFamily,
    ),
    labelLarge: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.bold,
      fontFamily: appSourceFontFamily,
    ),
    labelMedium: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.normal,
      fontFamily: appSourceFontFamily,
    ),
    labelSmall: TextStyle(
      color: ThemeConstants.txtColor,
      fontWeight: FontWeight.w400,
      fontFamily: appSourceFontFamily,
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
