import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import '../../../../../../core/constants/theme/border_radii.dart';

class OtpAreaWidget extends StatelessWidget {
  const OtpAreaWidget({
    super.key,
    required this.screenWidth,
    required this.otpVerifyController,
  });

  final double screenWidth;
  final TextEditingController otpVerifyController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.75,
        child: PinCodeTextField(
          appContext: context,
          keyboardType: TextInputType.number,
          length: 4,
          controller: otpVerifyController,
          cursorColor: AppColors.primaryColor,
          enableActiveFill: true,
          enabled: true,
          enablePinAutofill: true,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(BorderRadii.size_5),
              fieldHeight: BorderRadii.size_58,
              fieldWidth: BorderRadii.size_58,
              activeFillColor: AppColors.editTextBorder,
              activeColor: AppColors.editTextBorder,
              inactiveFillColor: AppColors.editTextBorder,
              selectedColor: AppColors.editTextBorder,
              selectedFillColor: AppColors.editTextBorder,
              disabledColor: AppColors.editTextBorder,
              inactiveColor: AppColors.editTextBorder),
          onChanged: (v) {},
          onCompleted: (value) {},
        ),
      ),
    );
  }
}
