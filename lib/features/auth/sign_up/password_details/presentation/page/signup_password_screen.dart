import 'package:flutter/material.dart';

import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../../../../../core/utils/validator/validators.dart';

class SingUpPasswordScreen extends StatelessWidget {
  SingUpPasswordScreen({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final signUpFamilyFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    signUpBtnPasswordTapped() {
      if (signUpFamilyFormKey.currentState!.validate()) {
        Navigator.pushNamed(context, AppRoutes.homeScreen);
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
              key: signUpFamilyFormKey,
              child: Column(
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
                    child: SharedTextFieldWidget(
                      textEditingController: passwordController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterFatherName,
                      validatorFunction: Validator().validatePassword,
                    ),
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: BorderRadii.size_10,
                    ),
                    child: SharedTextFieldWidget(
                      textEditingController: confirmPasswordController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterMotherName,
                      validatorFunction: Validator().validatePassword,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
