import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/config/theme/theme_config.dart';
import 'package:vishwakarmapatrika/core/constants/app_constants.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/page/signin_screen.dart';
import 'config/route/route_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.txtAppName,
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.getThemeData(AppTheme.light),
      onGenerateRoute: RouteHandler.onGenerateRoute,
      home: SignInScreen(),
    );
  }
}
