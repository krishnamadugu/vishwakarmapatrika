import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';

import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../../verify_otp/presentation/widgets/otp_header_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    bool obsVal = false;

    forgotPasswordBtnPasswordTapped() {
      if (newPasswordFormKey.currentState!.validate()) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.loginScreen,
          (Route<dynamic> route) => false,
        );
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
              key: newPasswordFormKey,
              child: Column(
                children: [
                  OtpHeaderWidget(
                    textTheme: textTheme,
                    screenWidth: screenWidth * 1.2,
                    otpHeaderText: AppStrings.txtRecoverAccount,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: BorderRadii.size_10,
                    ),
                    child: SharedTextFieldWidget(
                      obsTxtVal: obsVal,
                      suffixIconWidget: IconButton(
                        padding:
                            const EdgeInsets.only(right: BorderRadii.size_24),
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                      ),
                      textEditingController: newPasswordController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtNewPassword,
                      validatorFunction: sharedValidatorFunc,
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
                      obsTxtVal: obsVal,
                      suffixIconWidget: IconButton(
                        padding:
                            const EdgeInsets.only(right: BorderRadii.size_24),
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                      ),
                      textEditingController: confirmPasswordController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtConfirmPassword,
                      validatorFunction: sharedValidatorFunc,
                    ),
                  ),
                  const SizedBox(
                    height: BorderRadii.size_80,
                  ),
                  InkWell(
                    onTap: forgotPasswordBtnPasswordTapped,
                    child: SharedActionButtonWidget(
                      screenWidth: screenWidth,
                      textTheme: textTheme,
                      btnText: AppStrings.txtSubmit,
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
