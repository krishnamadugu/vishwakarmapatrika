import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

UnderlineInputBorder buildUnderlineInputBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor,
    ),
  );
}

String dateFormatConverter(DateTime dateTime) {
  String dateTimeVal = DateFormat('dd/MM/yyyy').format(dateTime);
  return dateTimeVal;
}

String formatTimeOfDay(TimeOfDay tod) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm();
  return format.format(dt);
}
