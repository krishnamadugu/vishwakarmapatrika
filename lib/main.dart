import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/config/theme/theme_config.dart';
import 'package:vishwakarmapatrika/core/constants/app_constants.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/page/signin_screen.dart';
import 'config/route/route_handler.dart';
import 'features/auth/sign_up/basic_details/presentation/cubit/signup_basic_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBasicCubit>(create: (context) => SignupBasicCubit()),
      ],
      child: MaterialApp(
        title: AppStrings.txtAppName,
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.getThemeData(AppTheme.light),
        onGenerateRoute: RouteHandler.onGenerateRoute,
        home: SignInScreen(),
      ),
    );
  }
}
