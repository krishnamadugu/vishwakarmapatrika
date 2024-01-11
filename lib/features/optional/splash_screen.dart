import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/config/route/app_routes.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/model/signin_model.dart';
import '../../config/route/route_arguments.dart';
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
      debugPrint('${await sharedPref.isUserLoggedIn()}');
      if (await sharedPref.isUserLoggedIn() == true) {
        SignInModel signInModel =
            await sharedPref.getUserData() ?? SignInModel();
        if (!(context.mounted)) {
          AppStrings.txtEmptyString;
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.bottomNavScreen,
            arguments: BottomNavArguments(signInModel),
            (Route<dynamic> route) => false,
          );
        }
      } else {
        !(context.mounted)
            ? AppStrings.txtEmptyString
            : Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginScreen,
                (route) => false,
              );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
