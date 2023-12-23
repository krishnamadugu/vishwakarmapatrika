import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/app_colors.dart';
import '../../../../../../core/constants/theme/font_size.dart';

class OtpHeaderWidget extends StatelessWidget {
  const OtpHeaderWidget({
    super.key,
    required this.textTheme,
    required this.screenWidth,
    required this.otpHeaderText,
  });

  final TextTheme textTheme;
  final double screenWidth;
  final String otpHeaderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.navigate_before,
                size: 26.0,
              ),
              Text(
                AppStrings.txtBack,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: FontSizes.size_20,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          children: [
            SizedBox(
              width: screenWidth * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                child: Text(
                  otpHeaderText,
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: FontSizes.size_42,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
