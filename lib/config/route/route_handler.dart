import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/presentation/screens/signup_basic_screen.dart';
import '../../features/error/error_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'app_routes.dart';

class RouteHandler {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    var routeName = routeSettings.name;
    //var routeArgs = routeSettings.arguments;

    switch (routeName) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (splashContext) => const HomeScreen(
            title: "my home page",
          ),
        );
      case AppRoutes.signUpScreen1:
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpBasicScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (errorContext) =>
                ErrorScreen(routeName: routeName.toString()));
    }
  }
}
