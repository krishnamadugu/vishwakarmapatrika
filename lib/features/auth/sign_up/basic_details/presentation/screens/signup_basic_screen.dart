import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/presentation/cubit/signup_basic_cubit.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../model/temp_user_profile_model.dart';

class SignUpBasicScreen extends StatelessWidget {
  SignUpBasicScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final List<String> items = [
    "Item 1 ",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];
  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final signupBasicCubit = BlocProvider.of<SignupBasicCubit>(context);
    String? selectedValue;

    signUpBtnPasswordTapped() {
      if (signUpFormKey.currentState!.validate()) {
        Navigator.pushNamed(context, AppRoutes.signUpScreen2);
      }
    }

    return BlocConsumer<SignupBasicCubit, TempUserProfileModel>(
      bloc: signupBasicCubit,
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              margin: const EdgeInsets.all(BorderRadii.size_20),
              child: SingleChildScrollView(
                child: Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
                      SignUpHeaderWidget(
                        headerText: AppStrings.txtSignUp,
                        textTheme: textTheme,
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      Stack(
                        children: [
                          state.imgUrl.isEmpty
                              ? const CircleAvatar(
                                  radius: BorderRadii.size_50,
                                  backgroundColor: AppColors.grey,
                                )
                              : CircleAvatar(
                                  radius: BorderRadii.size_50,
                                  backgroundColor: AppColors.grey,
                                  backgroundImage:
                                      FileImage(File(state.imgUrl)),
                                ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: InkWell(
                              onTap: () {
                                SharedImagePicker().showAttachmentBottomSheet(
                                    context, textTheme);
                              },
                              child: Container(
                                height: BorderRadii.size_36,
                                width: BorderRadii.size_36,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: AppColors.white,
                                    size: BorderRadii.size_20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: BorderRadii.size_40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: BorderRadii.size_10,
                        ),
                        child: SharedTextFieldWidget(
                          textEditingController: fullNameController,
                          textTheme: textTheme,
                          hintTxt: AppStrings.txtEnterFullName,
                          validatorFunction: sharedValidatorFunc,
                        ),
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: items,
                              hintText: AppStrings.txtSelectSubCaste,
                              selectedValue: selectedValue,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                          ),
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: items,
                              hintText: AppStrings.txtSelectGender,
                              selectedValue: selectedValue,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SharedContainerSignUpWidget(
                              containerTapped: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime(2100),
                                ).then(
                                  (pickedDate) {
                                    if (pickedDate != null) {
                                      final formattedDate =
                                          dateFormatConverter(pickedDate);
                                      signupBasicCubit.userDOB(formattedDate);
                                    }
                                  },
                                );
                              },
                              labelTxt: state.dob.isEmpty
                                  ? AppStrings.txtDOB
                                  : state.dob.toString(),
                              labelIcon: const Icon(
                                Icons.calendar_today,
                                size: BorderRadii.size_18,
                              ),
                              screenWidth: screenWidth,
                              textTheme: textTheme,
                            ),
                          ),
                          Expanded(
                            child: SharedContainerSignUpWidget(
                              containerTapped: () {
                                showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 6, minute: 45),
                                ).then((timeOfDay) {
                                  if (timeOfDay != null) {
                                    final formattedTOD =
                                        formatTimeOfDay(timeOfDay);
                                    signupBasicCubit
                                        .userBirthTime(formattedTOD);
                                  }
                                });
                              },
                              labelTxt: state.birthTime.isEmpty
                                  ? AppStrings.txtBirthTime
                                  : state.birthTime,
                              labelIcon: const Icon(
                                Icons.access_time_outlined,
                                size: BorderRadii.size_18,
                              ),
                              screenWidth: screenWidth,
                              textTheme: textTheme,
                            ),
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
                          textEditingController: birthPlaceController,
                          textTheme: textTheme,
                          hintTxt: AppStrings.txtEnterBirthPlace,
                          validatorFunction: sharedValidatorFunc,
                        ),
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: items,
                              selectedValue: selectedValue,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtManglikStatus,
                            ),
                          ),
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: items,
                              selectedValue: selectedValue,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtMaritalStatus,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: items,
                              selectedValue: selectedValue,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtProfileCreatedBy,
                            ),
                          ),
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: items,
                              selectedValue: selectedValue,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtEducation,
                            ),
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
                          textEditingController: occupationController,
                          textTheme: textTheme,
                          hintTxt: AppStrings.txtEnterOccupation,
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
                          textEditingController: hobbiesController,
                          textTheme: textTheme,
                          hintTxt: AppStrings.txtEnterHobbies,
                          validatorFunction: sharedValidatorFunc,
                        ),
                      ),
                      const SizedBox(
                        height: BorderRadii.size_30,
                      ),
                      InkWell(
                        onTap: signUpBtnPasswordTapped,
                        child: SharedActionButtonWidget(
                          screenWidth: screenWidth,
                          textTheme: textTheme,
                          btnText: AppStrings.txtContinue,
                        ),
                      ),
                      const SizedBox(
                        height: BorderRadii.size_58,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
