import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';
import 'package:vishwakarmapatrika/core/utils/shared/shared_methods.dart';
import '../../constants/app_strings.dart';

class SharedTextFieldWidget extends StatelessWidget {
  const SharedTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.validatorFunction,
    required this.textTheme,
    required this.hintTxt,
  });

  final TextEditingController textEditingController;
  final String? Function(String?)? validatorFunction;
  final TextTheme textTheme;
  final String hintTxt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validatorFunction,
      style: textTheme.labelSmall?.copyWith(
        fontSize: FontSizes.size_20,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: BorderRadii.size_18,
          horizontal: BorderRadii.size_30,
        ),
        errorStyle: textTheme.labelSmall?.copyWith(
          fontSize: FontSizes.size_14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        hintText: hintTxt,
        hintStyle: textTheme.labelSmall?.copyWith(
          fontSize: FontSizes.size_20,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BorderRadii.size_20,
          ),
          borderSide: const BorderSide(
            color: AppColors.textFieldBorderColor,
          ),
        ),
        enabledBorder: inputTextFieldBorder(),
        errorBorder: inputTextFieldBorder(),
        focusedBorder: inputTextFieldBorder(),
        suffixIcon: const SizedBox(
          width: 0,
        ),
      ),
    );
  }
}

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({
    super.key,
    required this.textTheme,
    required this.headerText,
  });

  final TextTheme textTheme;
  final String headerText;

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
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text(
            headerText,
            style: textTheme.titleLarge?.copyWith(
              color: AppColors.primaryColor,
              fontSize: FontSizes.size_24,
            ),
          ),
        ),
      ],
    );
  }
}
