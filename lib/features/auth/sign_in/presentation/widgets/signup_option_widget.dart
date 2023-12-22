import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';

class SignUpOptionWidget extends StatelessWidget {
  const SignUpOptionWidget({
    super.key,
    required this.textTheme,
    required this.signUpOptionTapped,
  });

  final TextTheme textTheme;
  final void Function()? signUpOptionTapped;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.txtDontHaveAccount,
            style: textTheme.bodySmall?.copyWith(
              fontSize: FontSizes.size_18,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: AppStrings.txtSignUp,
            recognizer: TapGestureRecognizer()..onTap = signUpOptionTapped,
            style: textTheme.bodySmall?.copyWith(
              fontSize: FontSizes.size_18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
