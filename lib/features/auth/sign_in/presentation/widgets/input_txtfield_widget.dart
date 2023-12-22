import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import '../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';
import '../../../../../core/utils/validator/validators.dart';

class InputTextFieldWidgets extends StatelessWidget {
  const InputTextFieldWidgets({
    super.key,
    required this.userNameTxtController,
    required this.textTheme,
    required this.passwordTxtController,
  });

  final TextEditingController userNameTxtController;
  final TextTheme textTheme;
  final TextEditingController passwordTxtController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BorderRadii.size_10,
          ),
          child: SharedTextFieldWidget(
            textEditingController: userNameTxtController,
            textTheme: textTheme,
            hintTxt: AppStrings.txtEnterName,
            validatorFunction: sharedValidatorFunc,
          ),
        ),
        const SizedBox(
          height: BorderRadii.size_20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BorderRadii.size_10,
          ),
          child: SharedTextFieldWidget(
            textEditingController: passwordTxtController,
            textTheme: textTheme,
            hintTxt: AppStrings.txtEnterPassword,
            validatorFunction: Validator().validatePassword,
          ),
        ),
      ],
    );
  }
}
