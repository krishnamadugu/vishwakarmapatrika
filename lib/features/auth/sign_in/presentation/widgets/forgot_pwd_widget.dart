import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';

class ForgotPwdWidget extends StatelessWidget {
  const ForgotPwdWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: BorderRadii.size_12,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.txtForgotPassword,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.black,
            fontSize: FontSizes.size_18,
          ),
        ),
      ),
    );
  }
}
