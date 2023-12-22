import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';

class SignInBtnWidget extends StatelessWidget {
  const SignInBtnWidget({
    super.key,
    required this.screenWidth,
    required this.textTheme,
  });

  final double screenWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: BorderRadii.size_58,
      margin: const EdgeInsets.all(
        BorderRadii.size_18,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(
          BorderRadii.size_18,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          AppStrings.txtSignIn,
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: FontSizes.size_24,
          ),
        ),
      ),
    );
  }
}
