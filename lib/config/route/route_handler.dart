import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/features/auth/forgot_password/enter_email/presentation/page/forgot_password.dart';
import 'package:vishwakarmapatrika/features/auth/forgot_password/verify_otp/presentation/page/verify_otp_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/page/signin_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/presentation/screens/signup_basic_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/contact_details/presentation/page/signup_contact_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/family_details/presentation/page/signup_family_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/password_details/presentation/page/signup_password_screen.dart';
import '../../features/auth/forgot_password/new_password/presentation/page/new_password_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/optional/error_screen.dart';
import 'app_routes.dart';

class RouteHandler {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    var routeName = routeSettings.name;
    //var routeArgs = routeSettings.arguments;

    switch (routeName) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (splashContext) => const HomeScreen(),
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (loginScreenContext) => SignInScreen(),
        );
      case AppRoutes.signUpScreen1:
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpBasicScreen(),
        );
      case AppRoutes.signUpScreen2:
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpFamilyScreen(),
        );
      case AppRoutes.signUpScreen3:
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpContactScreen(),
        );
      case AppRoutes.signUpScreen4:
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SingUpPasswordScreen(),
        );
      case AppRoutes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => ForgotPasswordScreen(),
        );
      case AppRoutes.otpScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => VerifyOtpScreen(),
        );
      case AppRoutes.recoverPasswordScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => NewPasswordScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (errorContext) =>
                ErrorScreen(routeName: routeName.toString()));
    }
  }
}
