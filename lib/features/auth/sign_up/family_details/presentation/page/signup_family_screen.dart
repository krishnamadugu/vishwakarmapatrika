import 'package:flutter/material.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';

class SignUpFamilyScreen extends StatelessWidget {
  SignUpFamilyScreen({super.key});
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final signUpFamilyFormKey = GlobalKey<FormState>();
  final List<String> items = [
    "Item 1 ",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    String? selectedValue;

    signUpBtnPasswordTapped() {
      if (signUpFamilyFormKey.currentState!.validate()) {
        Navigator.pushNamed(context, AppRoutes.signUpScreen3);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          margin: const EdgeInsets.all(BorderRadii.size_20),
          child: SingleChildScrollView(
            child: Form(
              key: signUpFamilyFormKey,
              child: Column(
                children: [
                  SignUpHeaderWidget(
                    headerText: AppStrings.txtFamilyDetails,
                    textTheme: textTheme,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: BorderRadii.size_10,
                    ),
                    child: SharedTextFieldWidget(
                      textEditingController: fatherNameController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterFatherName,
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
                      textEditingController: motherNameController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterMotherName,
                      validatorFunction: sharedValidatorFunc,
                    ),
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  SharedSignUpDropDownWidget(
                    textTheme: textTheme,
                    items: items,
                    hintText: AppStrings.txtMarriedBrothers,
                    selectedValue: selectedValue,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  SharedSignUpDropDownWidget(
                    textTheme: textTheme,
                    items: items,
                    hintText: AppStrings.txtUnMarriedBrothers,
                    selectedValue: selectedValue,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  SharedSignUpDropDownWidget(
                    textTheme: textTheme,
                    items: items,
                    hintText: AppStrings.txtMarriedSisters,
                    selectedValue: selectedValue,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  SharedSignUpDropDownWidget(
                    textTheme: textTheme,
                    items: items,
                    hintText: AppStrings.txtUnMarriedSisters,
                    selectedValue: selectedValue,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(
                    height: BorderRadii.size_40,
                  ),
                  InkWell(
                    onTap: signUpBtnPasswordTapped,
                    child: SharedActionButtonWidget(
                      screenWidth: screenWidth,
                      textTheme: textTheme,
                      btnText: AppStrings.txtContinue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
