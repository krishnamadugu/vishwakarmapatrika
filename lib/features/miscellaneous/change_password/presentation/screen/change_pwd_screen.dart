import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/utils/validator/validators.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/theme/border_radii.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  TextEditingController currentPasswordTxtController = TextEditingController();
  TextEditingController newPasswordTxtController = TextEditingController();
  TextEditingController confirmPasswordTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    final changePasswordFormKey = GlobalKey<FormState>();

    signUpBtnPasswordTapped() {
      if (changePasswordFormKey.currentState!.validate()) {
        if (newPasswordTxtController.text !=
            confirmPasswordTxtController.text) {
          showToastMsg(AppStrings.txtPasswordDontMatch);
          return;
        }
        Navigator.pop(context);
        // userSignUpData['password'] = confirmPasswordController.text;
        // signUpPasswordCubit.signUpUser(context);
      }
    }

    return Scaffold(
      appBar: sharedAppBarWidget(
        appTextName: AppStrings.txtChangePassword,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: changePasswordFormKey,
            child: Column(
              children: [
                SharedTextFieldWidget(
                  textEditingController: currentPasswordTxtController,
                  validatorFunction: Validator().validatePassword,
                  textTheme: textTheme,
                  hintTxt: AppStrings.txtEnterCurrentPassword,
                ),
                const SizedBox(
                  height: BorderRadii.size_20,
                ),
                SharedTextFieldWidget(
                  textEditingController: newPasswordTxtController,
                  validatorFunction: Validator().validatePassword,
                  textTheme: textTheme,
                  hintTxt: AppStrings.txtNewPassword,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SharedTextFieldWidget(
                  textEditingController: confirmPasswordTxtController,
                  validatorFunction: Validator().validatePassword,
                  textTheme: textTheme,
                  hintTxt: AppStrings.txtConfirmPassword,
                ),
                const SizedBox(
                  height: BorderRadii.size_40,
                ),
                InkWell(
                  onTap: signUpBtnPasswordTapped,
                  child: SharedActionButtonWidget(
                    screenWidth: screenWidth,
                    textTheme: textTheme,
                    btnText: AppStrings.txtChangePassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
