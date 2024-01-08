import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/app_constants.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/model/signin_model.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../config/route/route_arguments.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../../../../../core/utils/validator/validators.dart';
import '../../model/temp_signup_password_model.dart';
import '../cubit/signup_password_cubit.dart';

class SingUpPasswordScreen extends StatelessWidget {
  SingUpPasswordScreen({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final signUpPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final signUpPasswordCubit = BlocProvider.of<SignUpPasswordCubit>(context);

    signUpBtnPasswordTapped() {
      if (signUpPasswordFormKey.currentState!.validate()) {
        signUpPasswordCubit.userEnterPassword(passwordController.text);
        signUpPasswordCubit.userConfirmPassword(confirmPasswordController.text);
        if (passwordController.text != confirmPasswordController.text) {
          showToastMsg(AppStrings.txtPasswordDontMatch);
          return;
        }
        userSignUpData['password'] = confirmPasswordController.text;
        signUpPasswordCubit.signUpUser(context);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          margin: const EdgeInsets.all(BorderRadii.size_20),
          child: SingleChildScrollView(
            child: Form(
              key: signUpPasswordFormKey,
              child: BlocConsumer<SignUpPasswordCubit, SignUpPasswordModel>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, state) {
                  return Column(
                    children: [
                      SignUpHeaderWidget(
                        headerText: AppStrings.txtFinalStep,
                        textTheme: textTheme,
                      ),
                      const SizedBox(
                        height: BorderRadii.size_50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: BorderRadii.size_10,
                        ),
                        child: BlocBuilder<PasswordObscureCubit, bool>(
                          builder: (BuildContext context, state) {
                            return Column(
                              children: [
                                SharedTextFieldWidget(
                                  textEditingController: passwordController,
                                  textTheme: textTheme,
                                  hintTxt: AppStrings.txtEnterPassword,
                                  validatorFunction:
                                      Validator().validatePassword,
                                  obsTxtVal: !(state),
                                  suffixIconWidget: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<PasswordObscureCubit>(
                                              context)
                                          .updateObscureVal(!state);
                                    },
                                    icon: Icon(
                                      (state)
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppColors.black.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: BorderRadii.size_20,
                                ),
                                SharedTextFieldWidget(
                                  textEditingController:
                                      confirmPasswordController,
                                  textTheme: textTheme,
                                  obsTxtVal: !(state),
                                  hintTxt: AppStrings.txtConfirmPassword,
                                  validatorFunction:
                                      Validator().validatePassword,
                                  suffixIconWidget: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<PasswordObscureCubit>(
                                              context)
                                          .updateObscureVal(!state);
                                    },
                                    icon: Icon(
                                      (state)
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppColors.black.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: BorderRadii.size_40,
                      ),
                      InkWell(
                        onTap: signUpBtnPasswordTapped,
                        child: SharedActionButtonWidget(
                          screenWidth: screenWidth,
                          textTheme: textTheme,
                          btnText: AppStrings.txtFinishSignup,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
