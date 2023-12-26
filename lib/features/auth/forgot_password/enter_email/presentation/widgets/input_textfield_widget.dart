import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/app_colors.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/constants/theme/font_size.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/validator/validators.dart';

class InputTextFieldWidget extends StatelessWidget {
  const InputTextFieldWidget({
    super.key,
    required this.emailAddressController,
    required this.textTheme,
  });

  final TextEditingController emailAddressController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: BorderRadii.size_10,
      ),
      child: TextFormField(
        controller: emailAddressController,
        validator: Validator().validateEmail,
        style: textTheme.labelSmall?.copyWith(
          fontSize: FontSizes.size_20,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: BorderRadii.size_18,
            horizontal: BorderRadii.size_10,
          ),
          errorStyle: textTheme.labelSmall?.copyWith(
            fontSize: FontSizes.size_14,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
          hintText: AppStrings.txtEnterEmailAddress,
          hintStyle: textTheme.labelSmall?.copyWith(
            fontSize: FontSizes.size_20,
            fontWeight: FontWeight.w300,
          ),
          focusedBorder: buildUnderlineInputBorder(),
          suffixIcon: const SizedBox(
            width: 0,
          ),
        ),
      ),
    );
  }
}
