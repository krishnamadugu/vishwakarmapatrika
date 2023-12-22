import 'package:flutter/material.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';

class SignUpContactScreen extends StatelessWidget {
  SignUpContactScreen({super.key});

  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();
  final TextEditingController cityNameController = TextEditingController();
  final signUpContactFormKey = GlobalKey<FormState>();
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
      if (signUpContactFormKey.currentState!.validate()) {
        Navigator.pushNamed(context, AppRoutes.signUpScreen4);
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
              key: signUpContactFormKey,
              child: Column(
                children: [
                  SignUpHeaderWidget(
                    headerText: AppStrings.txtContactDetails,
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
                      textEditingController: mobileNumberController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterMobileNum,
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
                      textEditingController: emailAddressController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterEmailAddress,
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
                      textEditingController: fullAddressController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterFullAddress,
                      validatorFunction: sharedValidatorFunc,
                    ),
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  Row(
                    children: [
                      SharedSignUpDropDownWidget(
                        textTheme: textTheme,
                        items: items,
                        hintText: AppStrings.txtSelectYourState,
                        selectedValue: selectedValue,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: BorderRadii.size_20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: BorderRadii.size_10,
                    ),
                    child: SharedTextFieldWidget(
                      textEditingController: cityNameController,
                      textTheme: textTheme,
                      hintTxt: AppStrings.txtEnterCityName,
                      validatorFunction: sharedValidatorFunc,
                    ),
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
