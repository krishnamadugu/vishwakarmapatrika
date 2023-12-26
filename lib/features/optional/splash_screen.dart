import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/config/route/app_routes.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1), () async {
      await sharedPref.isUserLoggedIn() == true
          ? !(context.mounted)
              ? AppStrings.txtEmptyString
              : Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeScreen,
                  (route) => false,
                )
          : !(context.mounted)
              ? AppStrings.txtEmptyString
              : Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeScreen,
                  (route) => false,
                );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
