import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vishwakarmapatrika/config/theme/theme_config.dart';
import 'package:vishwakarmapatrika/core/constants/app_constants.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/data/data_provider/signin_data_provider.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/bloc/signin_bloc.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/data/data_source/form_field_list_data_provider.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/contact_details/presentation/cubit/signup_contact_cubit.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/family_details/presentation/cubit/signup_family_cubit.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/password_details/data/data_source/singup_finished_datasource.dart';
import 'package:vishwakarmapatrika/features/find_partner/data/data_provider/find_partner_data_provider.dart';
import 'package:vishwakarmapatrika/features/find_partner/data/repo/find_partner_repo.dart';
import 'package:vishwakarmapatrika/features/find_partner/presentation/bloc/find_partner_bloc.dart';
import 'package:vishwakarmapatrika/features/home/data/data_source/home_data_provider.dart';
import 'package:vishwakarmapatrika/features/home/data/repos/home_repo.dart';
import 'package:vishwakarmapatrika/features/home/presentation/bloc/home_bloc.dart';
import 'package:vishwakarmapatrika/features/home/presentation/cubit/home_cubit.dart';
import 'config/route/route_handler.dart';
import 'features/auth/sign_in/data/repos/signin_repo.dart';
import 'features/auth/sign_up/basic_details/data/repo/form_filed_list_repo.dart';
import 'features/auth/sign_up/basic_details/presentation/cubit/signup_basic_cubit.dart';
import 'features/auth/sign_up/password_details/data/repos/signup_finished_repo.dart';
import 'features/auth/sign_up/password_details/presentation/cubit/signup_password_cubit.dart';
import 'features/find_partner/presentation/cubit/find_partner_cubit.dart';
import 'features/optional/splash_screen.dart';
import 'features/other_user_profile/presentation/screens/other_user_profile_screen.dart';

//ignore: must_be_immutable
void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              SingInRepository(signinDataProvider: SigninDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => FormFieldListRepository(
              formFieldListDataProvider: FormFieldListDataProvider()),
        ),
        RepositoryProvider(
          create: (context) =>
              SignUpFinishedRepo(signUpDataProvider: SignUpDataProvider()),
        ),
        RepositoryProvider(
          create: (context) =>
              HomeRepository(homeScreenDataProvider: HomeScreenDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => FindPartnerRepository(
              findPartnerScreenDataProvider: FindPartnerDataProvider()),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignupBasicCubit>(
              create: (context) => SignupBasicCubit()),
          BlocProvider<PasswordObscureCubit>(
              create: (context) => PasswordObscureCubit()),
          BlocProvider<SignUpPasswordCubit>(
              create: (context) =>
                  SignUpPasswordCubit(context.read<SignUpFinishedRepo>())),
          BlocProvider<SignUpContactCubit>(
              create: (context) => SignUpContactCubit()),
          BlocProvider<SignUpFamilyCubit>(
              create: (context) => SignUpFamilyCubit()),
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
          BlocProvider(
            create: (context) => SignInBloc(
              context.read<SingInRepository>(),
              context.read<FormFieldListRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => FindPartnerBloc(
                findPartnerRepository: context.read<FindPartnerRepository>())
              ..add(FindGroomPartnerEvent()),
          ),
          BlocProvider(
            create: (context) =>
                HomeBloc(homeRepository: context.read<HomeRepository>())
                  ..add(
                    HomeGetAllProfilesEvent(),
                  ),
          ),
          BlocProvider(
            create: (context) => FindPartnerCubit(),
          ),
        ],
        child: MaterialApp(
          title: AppStrings.txtAppName,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.getThemeData(AppTheme.light),
          onGenerateRoute: RouteHandler.onGenerateRoute,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
