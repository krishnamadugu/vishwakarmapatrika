import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import '../../../../../core/constants/theme/app_colors.dart';
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
          child: BlocBuilder<PasswordObscureCubit, bool>(
            builder: (BuildContext context, state) {
              return SharedTextFieldWidget(
                textEditingController: passwordTxtController,
                textTheme: textTheme,
                obsTxtVal: !state,
                hintTxt: AppStrings.txtEnterPassword,
                validatorFunction: Validator().validatePassword,
                suffixIconWidget: IconButton(
                  onPressed: () {
                    BlocProvider.of<PasswordObscureCubit>(context)
                        .updateObscureVal(!state);
                  },
                  icon: Icon(
                    state ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.black.withOpacity(0.3),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
