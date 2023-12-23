import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/utils/shared/shared_widgets.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../widgets/input_textfield_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailAddressController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    forgotPasswordBtnPasswordTapped() {
      if (forgotPasswordFormKey.currentState!.validate()) {
        Navigator.pushNamed(context, AppRoutes.otpScreen);
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
              key: forgotPasswordFormKey,
              child: Column(
                children: [
                  ForgotPasswordHeaderWidget(
                    headerText: AppStrings.txtForgotYourPassword,
                    textTheme: textTheme,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_80 * 1.5,
                  ),
                  InputTextFieldWidget(
                    emailAddressController: emailAddressController,
                    textTheme: textTheme,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_80,
                  ),
                  InkWell(
                    onTap: forgotPasswordBtnPasswordTapped,
                    child: SharedActionButtonWidget(
                      screenWidth: screenWidth,
                      textTheme: textTheme,
                      btnText: AppStrings.txtContinue,
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
