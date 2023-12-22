import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeConfig {
  static ThemeData getThemeData(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return lightTheme;
      case AppTheme.dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
