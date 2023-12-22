import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../constants/theme/app_colors.dart';
import '../../constants/theme/border_radii.dart';

String? sharedValidatorFunc(String? value) {
  if (value == null || value.trim() == AppStrings.txtEmptyString) {
    return AppStrings.txtFieldValidator;
  } else {
    return null;
  }
}

OutlineInputBorder inputTextFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      BorderRadii.size_20,
    ),
    borderSide: const BorderSide(
      color: AppColors.textFieldBorderColor,
    ),
  );
}
