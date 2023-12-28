import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/config/theme/theme_config.dart';
import 'package:vishwakarmapatrika/core/constants/app_constants.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/contact_details/presentation/cubit/signup_contact_cubit.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/family_details/presentation/cubit/signup_family_cubit.dart';
import 'package:vishwakarmapatrika/features/home/presentation/cubit/home_cubit.dart';
import 'config/route/route_handler.dart';
import 'features/auth/sign_up/basic_details/presentation/cubit/signup_basic_cubit.dart';
import 'features/auth/sign_up/password_details/presentation/cubit/signup_password_cubit.dart';
import 'features/optional/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBasicCubit>(create: (context) => SignupBasicCubit()),
        //BlocProvider<HomeOverallCubit>(create: (context) => HomeOverallCubit()),
        BlocProvider<PasswordObscureCubit>(
            create: (context) => PasswordObscureCubit()),
        BlocProvider<SignUpPasswordCubit>(
            create: (context) => SignUpPasswordCubit()),
        BlocProvider<SignUpContactCubit>(
            create: (context) => SignUpContactCubit()),
        BlocProvider<SignUpFamilyCubit>(
            create: (context) => SignUpFamilyCubit()),
      ],
      child: MaterialApp(
        title: AppStrings.txtAppName,
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.getThemeData(AppTheme.light),
        onGenerateRoute: RouteHandler.onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
