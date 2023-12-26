import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/family_details/model/temp_user_family_model.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/family_details/presentation/cubit/signup_family_cubit.dart';
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
    String? marriedBroCountVal;
    String? unMarriedBroCountVal;
    String? marriedSisCountVal;
    String? unMarriedSisCountVal;
    final signUpFamilyCubit = BlocProvider.of<SignUpFamilyCubit>(context);

    signUpBtnPasswordTapped() {
      if (signUpFamilyFormKey.currentState!.validate()) {
        signUpFamilyCubit.userFatherName(fatherNameController.text);
        signUpFamilyCubit.userMotherName(motherNameController.text);
        signUpFamilyCubit.signUpFamilyValidation(context);
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
              child: BlocConsumer<SignUpFamilyCubit, TempUserFamilyModel>(
                bloc: signUpFamilyCubit,
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, state) {
                  return Column(
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
                        selectedValue:
                            signUpFamilyCubit.state.marriedBrothersCount.isEmpty
                                ? marriedBroCountVal
                                : signUpFamilyCubit.state.marriedBrothersCount,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        onChangedFun: (value) {
                          signUpFamilyCubit
                              .userMarriedBrothersCount(value ?? '');
                        },
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      SharedSignUpDropDownWidget(
                        textTheme: textTheme,
                        items: items,
                        hintText: AppStrings.txtUnMarriedBrothers,
                        selectedValue: signUpFamilyCubit
                                .state.unMarriedBrothersCount.isEmpty
                            ? unMarriedBroCountVal
                            : signUpFamilyCubit.state.unMarriedBrothersCount,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        onChangedFun: (value) {
                          signUpFamilyCubit
                              .userUnMarriedBrothersCount(value ?? '');
                        },
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      SharedSignUpDropDownWidget(
                        textTheme: textTheme,
                        items: items,
                        hintText: AppStrings.txtMarriedSisters,
                        selectedValue:
                            signUpFamilyCubit.state.marriedSistersCount.isEmpty
                                ? marriedSisCountVal
                                : signUpFamilyCubit.state.marriedSistersCount,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        onChangedFun: (value) {
                          signUpFamilyCubit
                              .userMarriedSistersCount(value ?? '');
                        },
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      SharedSignUpDropDownWidget(
                        textTheme: textTheme,
                        items: items,
                        hintText: AppStrings.txtUnMarriedSisters,
                        selectedValue: signUpFamilyCubit
                                .state.unMarriedSistersCount.isEmpty
                            ? unMarriedSisCountVal
                            : signUpFamilyCubit.state.unMarriedSistersCount,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        onChangedFun: (value) {
                          signUpFamilyCubit
                              .userUnMarriedSistersCount(value ?? '');
                        },
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
