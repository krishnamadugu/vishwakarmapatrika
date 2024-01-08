import 'package:vishwakarmapatrika/core/utils/validator/regex_exps.dart';
import '../../constants/app_strings.dart';

class Validator {
  bool validateStructure(String value, String pattern) {
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String? validatePassword(String? value) {
    if (!validateStructure(value!, Regex.passwordRegexExp)) {
      return AppStrings.txtValidatePassword;
    }
    return null;
  }

  String? validateMobileNum(String? value) {
    if ((value == null || value.trim() == AppStrings.txtEmptyString)) {
      return AppStrings.txtFieldValidator;
    } else if (value.length != 10) {
      return AppStrings.txtValidateMobileNumber;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (!(value!.contains('@'))) {
      return AppStrings.txtPleaseEnterValidAddress;
    }
    return null;
  }
}
