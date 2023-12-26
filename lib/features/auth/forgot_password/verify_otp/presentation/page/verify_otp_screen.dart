import 'package:flutter/material.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../widgets/otp_area_widget.dart';
import '../widgets/otp_header_widget.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});
  final TextEditingController otpVerifyController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    forgotPasswordBtnPasswordTapped() {
      if (otpFormKey.currentState!.validate()) {
        if (otpVerifyController.text.length < 4) {
          showToastMsg(AppStrings.txtPleaseEnterValidOtp);
          return;
        }
        Navigator.pushNamed(context, AppRoutes.recoverPasswordScreen);
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
              key: otpFormKey,
              child: Column(
                children: [
                  OtpHeaderWidget(
                    otpHeaderText: AppStrings.txtPleaseEnterOtp,
                    textTheme: textTheme,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_80,
                  ),
                  OtpAreaWidget(
                    screenWidth: screenWidth,
                    otpVerifyController: otpVerifyController,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_8,
                  ),
                  InkWell(
                    child: SharedRichTextWidget(
                      text1: AppStrings.txtDontGetTheOtp,
                      text2: AppStrings.txtResendOtp,
                      textTheme: textTheme,
                      signUpOptionTapped: () {},
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
