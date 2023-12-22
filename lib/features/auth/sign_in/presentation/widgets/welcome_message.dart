import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.txtHello,
          style: textTheme.displayLarge?.copyWith(
            fontSize: FontSizes.size_24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.txtSignInMsg,
          style: textTheme.headlineSmall?.copyWith(
            fontSize: FontSizes.size_20,
          ),
        ),
      ],
    );
  }
}
