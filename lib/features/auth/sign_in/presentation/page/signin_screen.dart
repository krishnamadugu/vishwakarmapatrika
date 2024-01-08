import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/config/route/app_routes.dart';
import 'package:vishwakarmapatrika/config/route/route_arguments.dart';
import 'package:vishwakarmapatrika/core/constants/app_images.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/bloc/signin_bloc.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';
import '../widgets/forgot_pwd_widget.dart';
import '../widgets/input_txtfield_widget.dart';
import '../widgets/welcome_message.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController userNameTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();
  final signinFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    signInBtnPasswordTapped() async {
      if (signinFormKey.currentState!.validate()) {
        if (!(context.mounted)) return;
        context.read<SignInBloc>().add(SignInUserEvent(
              userName: userNameTxtController.text,
              password: passwordTxtController.text,
            ));
      }
    }

    signUpBtnTapped() {
      context.read<SignInBloc>().add(FormFieldDataEvent());
    }

    forgotPasswordTapped() {
      Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
    }

    return BlocListener<SignInBloc, SignInState>(
      listener: (BuildContext context, SignInState state) async {
        if (state is SignInLoadingState) {
          sharedLoadingIndicatorWidget(
              context, screenHeight, screenWidth, AppColors.primaryColor);
        } else if (state is SignInFailureState) {
          Navigator.pop(context);
          showToastMsg(state.errorMsg.toString());
        } else if (state is SignInSuccessState) {
          await sharedPref.setLoggedIn(true);
          await sharedPref.saveUserData(state.signInModel);
          if (context.mounted) {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.homeScreen,
              arguments: HomeScreenArguments(state.signInModel),
              (Route<dynamic> route) => false,
            );
          }
        } else if (state is GetFormFieldDataState) {
          if (context.mounted) {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              arguments:
                  BasicSignUpDetailsArguments(state.formFieldListDataModel),
              AppRoutes.signUpScreen1,
            );
          }
        }
      },
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: AppColors.white,
          image: DecorationImage(
            image: AssetImage(
              AppImages.signInBackgroundImg,
            ),
            scale: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              margin: const EdgeInsets.all(BorderRadii.size_20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.2,
                      child: WelcomeMessage(textTheme: textTheme),
                    ),
                    const SizedBox(
                      height: BorderRadii.size_30,
                    ),
                    SizedBox(
                      height: screenHeight * 0.7,
                      child: Column(
                        children: [
                          Text(
                            AppStrings.txtUserLogin,
                            style: textTheme.titleLarge?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: BorderRadii.size_32,
                          ),
                          Form(
                            key: signinFormKey,
                            child: InputTextFieldWidgets(
                              userNameTxtController: userNameTxtController,
                              textTheme: textTheme,
                              passwordTxtController: passwordTxtController,
                            ),
                          ),
                          const SizedBox(
                            height: BorderRadii.size_14,
                          ),
                          InkWell(
                            onTap: forgotPasswordTapped,
                            child: ForgotPwdWidget(
                              textTheme: textTheme,
                            ),
                          ),
                          const SizedBox(
                            height: BorderRadii.size_14,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: signInBtnPasswordTapped,
                                child: SharedActionButtonWidget(
                                  screenWidth: screenWidth,
                                  textTheme: textTheme,
                                  btnText: AppStrings.txtSignIn,
                                ),
                              ),
                              const SizedBox(
                                height: BorderRadii.size_8,
                              ),
                              InkWell(
                                child: SharedRichTextWidget(
                                  text1: AppStrings.txtDontHaveAccount,
                                  text2: AppStrings.txtSignUp,
                                  textTheme: textTheme,
                                  signUpOptionTapped: signUpBtnTapped,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
