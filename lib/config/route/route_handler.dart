import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/config/route/route_arguments.dart';
import 'package:vishwakarmapatrika/features/auth/forgot_password/enter_email/presentation/page/forgot_password.dart';
import 'package:vishwakarmapatrika/features/auth/forgot_password/verify_otp/presentation/page/verify_otp_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/page/signin_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/presentation/screens/signup_basic_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/contact_details/presentation/page/signup_contact_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/family_details/presentation/page/signup_family_screen.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/password_details/presentation/page/signup_password_screen.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/presentation/screen/about_us_screen.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/change_password/presentation/screen/change_pwd_screen.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/contact_us/presentation/screen/contact_us_screen.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/support_us/presentation/screen/support_us_screen.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/update_profile/presentation/screen/update_profile_screen.dart';
import 'package:vishwakarmapatrika/features/payment/presentation/screens/payment_screen.dart';
import '../../features/auth/forgot_password/new_password/presentation/page/new_password_screen.dart';
import '../../features/bottom_nav_bar/presentation/screen/bottom_nav_bar.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/optional/error_screen.dart';
import '../../features/other_user_profile/presentation/screens/other_user_profile_screen.dart';
import 'app_routes.dart';

class RouteHandler {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    var routeName = routeSettings.name;
    var routeArgs = routeSettings.arguments;

    switch (routeName) {
      case AppRoutes.homeScreen:
        final args = routeArgs as HomeArguments;
        return MaterialPageRoute(
          builder: (splashContext) => HomeScreen(
            userId: args.id,
          ),
        );
      case AppRoutes.bottomNavScreen:
        final args = routeArgs as BottomNavArguments;
        return MaterialPageRoute(
          builder: (splashContext) => BottomNavBarScreen(
            signInModel: args.signInModel,
          ),
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (loginScreenContext) => SignInScreen(),
        );
      case AppRoutes.signUpScreen1:
        final args = routeArgs as BasicSignUpDetailsArguments;
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpBasicScreen(
            formFieldListDataModel: args.formFieldListDataModel,
          ),
        );
      case AppRoutes.signUpScreen2:
        final args = routeArgs as BasicSignUpDetailsArguments;
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpFamilyScreen(
            formFieldListDataModel: args.formFieldListDataModel,
          ),
        );
      case AppRoutes.signUpScreen3:
        final args = routeArgs as BasicSignUpDetailsArguments;
        return MaterialPageRoute(
          builder: (signUpBasicScreenContext) => SignUpContactScreen(
            formFieldListDataModel: args.formFieldListDataModel,
          ),
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
      case AppRoutes.otherUserProfileScreen:
        final args = routeArgs as OtherUserProfileArguments;
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => OtherUserProfileScreen(
            loggedUserId: args.loggedUserId,
            otherUserId: args.otherUserId,
          ),
        );
      case AppRoutes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => ChangePasswordScreen(),
        );
      case AppRoutes.updateProfileScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => UpdateProfileScreen(),
        );
      case AppRoutes.paymentScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => PaymentScreen(),
        );
      case AppRoutes.aboutUsScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => AboutUsScreen(),
        );
      case AppRoutes.supportUsScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => SupportUsScreen(),
        );
      case AppRoutes.contactUsScreen:
        return MaterialPageRoute(
          builder: (forgotPasswordContext) => ContactUsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (errorContext) =>
              ErrorScreen(routeName: routeName.toString()),
        );
    }
  }
}
