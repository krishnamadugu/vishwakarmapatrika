import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/features/auth/sign_up/basic_details/presentation/cubit/signup_basic_cubit.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/constants/theme/font_size.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';
import '../../model/form_field_list_model.dart';
import '../../model/temp_user_profile_model.dart';

class SignUpBasicScreen extends StatelessWidget {
  SignUpBasicScreen({super.key, required this.formFieldListDataModel});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final FormFieldListDataModel formFieldListDataModel;

  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final List<String> subCasteItems =
        formFieldListDataModel.data?.subcaste ?? [];
    final List<String> genderItems = ["Male", "Female"];
    final List<String> manglikStatusItems = ["Yes", "No"];
    final List<String> maritalStatusItems =
        formFieldListDataModel.data?.maritalStatus ?? [];
    final List<String> createdByItems =
        formFieldListDataModel.data?.profileBy ?? [];
    final List<String> educationItems =
        formFieldListDataModel.data?.educationsLists ?? [];
    final List<String> heightFtItems =
        List.generate(4, (index) => "${index + 3} Feet");
    final List<String> heightInItems =
        List.generate(12, (index) => "${index} Inches");
    final signupBasicCubit = BlocProvider.of<SignupBasicCubit>(context);
    String? userSelectedSubCasteValue;
    String? userSelectedGenderValue;
    String? userSelectedManglikStatusValue;
    String? userSelectedMaritalStatusValue;
    String? userSelectedCreatedByValue;
    String? userSelectedEducationValue;
    String? userSelectedHeightInFeet;
    String? userSelectedHeightInInches;

    signUpBtnPasswordTapped() {
      if (signUpFormKey.currentState!.validate()) {
        BlocProvider.of<SignupBasicCubit>(context)
            .userName(fullNameController.text);
        BlocProvider.of<SignupBasicCubit>(context)
            .userBirthPlace(birthPlaceController.text);
        BlocProvider.of<SignupBasicCubit>(context)
            .userOccupation(occupationController.text);
        BlocProvider.of<SignupBasicCubit>(context)
            .userHobbies(hobbiesController.text);
        BlocProvider.of<SignupBasicCubit>(context)
            .signUpBasicValidation(context, formFieldListDataModel);
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
                              items: subCasteItems,
                              hintText: AppStrings.txtSelectSubCaste,
                              selectedValue:
                                  signupBasicCubit.state.subCaste.isEmpty
                                      ? userSelectedSubCasteValue
                                      : signupBasicCubit.state.subCaste,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              onChangedFun: (value) {
                                BlocProvider.of<SignupBasicCubit>(context)
                                    .userSubCaste(value ?? "");
                              },
                            ),
                          ),
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: genderItems,
                              hintText: AppStrings.txtSelectGender,
                              selectedValue:
                                  signupBasicCubit.state.gender.isEmpty
                                      ? userSelectedGenderValue
                                      : signupBasicCubit.state.gender,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              onChangedFun: (value) {
                                BlocProvider.of<SignupBasicCubit>(context)
                                    .userSelectGender(value ?? "");
                              },
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
                              items: manglikStatusItems,
                              selectedValue:
                                  signupBasicCubit.state.manglikStatus.isEmpty
                                      ? userSelectedManglikStatusValue
                                      : signupBasicCubit.state.manglikStatus,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtManglikStatus,
                              onChangedFun: (value) {
                                BlocProvider.of<SignupBasicCubit>(context)
                                    .userManglikStatus(value ?? "");
                              },
                            ),
                          ),
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: maritalStatusItems,
                              selectedValue:
                                  signupBasicCubit.state.maritalStatus.isEmpty
                                      ? userSelectedMaritalStatusValue
                                      : signupBasicCubit.state.maritalStatus,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtMaritalStatus,
                              onChangedFun: (value) {
                                BlocProvider.of<SignupBasicCubit>(context)
                                    .userMartialStatus(value ?? "");
                              },
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
                              items: heightFtItems,
                              selectedValue:
                                  signupBasicCubit.state.heightFt.isEmpty
                                      ? userSelectedHeightInFeet
                                      : signupBasicCubit.state.heightFt,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtHeightInFt,
                              onChangedFun: (value) {
                                BlocProvider.of<SignupBasicCubit>(context)
                                    .heightInFt(value ?? "");
                              },
                            ),
                          ),
                          Expanded(
                            child: SharedDropDownWidget(
                              textTheme: textTheme,
                              items: heightInItems,
                              selectedValue:
                                  signupBasicCubit.state.heightIn.isEmpty
                                      ? userSelectedHeightInInches
                                      : signupBasicCubit.state.heightIn,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              hintText: AppStrings.txtHeightInInches,
                              onChangedFun: (value) {
                                BlocProvider.of<SignupBasicCubit>(context)
                                    .heightInInches(value ?? "");
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: BorderRadii.size_20,
                      ),
                      Column(
                        children: [
                          SharedDropDownSingleWidget(
                            textTheme: textTheme,
                            items: createdByItems,
                            selectedValue:
                                signupBasicCubit.state.createdBy.isEmpty
                                    ? userSelectedCreatedByValue
                                    : signupBasicCubit.state.createdBy,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth * 2,
                            hintText: AppStrings.txtProfileCreatedBy,
                            onChangedFun: (value) {
                              BlocProvider.of<SignupBasicCubit>(context)
                                  .userCreatedBy(value ?? "");
                            },
                          ),
                          const SizedBox(
                            height: BorderRadii.size_20,
                          ),
                          SharedDropDownSingleWidget(
                            textTheme: textTheme,
                            items: educationItems,
                            selectedValue:
                                signupBasicCubit.state.education.isEmpty
                                    ? userSelectedEducationValue
                                    : signupBasicCubit.state.education,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth * 2,
                            hintText: AppStrings.txtEducation,
                            onChangedFun: (value) {
                              BlocProvider.of<SignupBasicCubit>(context)
                                  .userEducationLevel(value ?? "");
                            },
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

class SharedDropDownSingleWidget extends StatelessWidget {
  const SharedDropDownSingleWidget({
    super.key,
    required this.textTheme,
    required this.items,
    required this.selectedValue,
    required this.screenHeight,
    required this.screenWidth,
    required this.hintText,
    required this.onChangedFun,
  });

  final TextTheme textTheme;
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final double screenHeight;
  final double screenWidth;
  final void Function(String?)? onChangedFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: BorderRadii.size_10,
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              hintText,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: FontSizes.size_13,
              ),
            ),
            items: items
                .map(
                  (String item) => item.startsWith('-')
                      ? DropdownMenuItem<String>(
                          value: item,
                          enabled: false,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: AppColors.black.withOpacity(0.4),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                )
                .toList(),
            value: selectedValue,
            onChanged: onChangedFun,
            buttonStyleData: ButtonStyleData(
              height: screenHeight * 0.055,
              width: screenWidth * 0.5,
              padding: const EdgeInsets.symmetric(
                horizontal: BorderRadii.size_14,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  BorderRadii.size_14,
                ),
                border: Border.all(
                  color: AppColors.lightRed,
                ),
                // color: Colors.redAccent,
              ),
              //elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down,
              ),
              iconSize: BorderRadii.size_28,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: screenHeight * 0.2,
              width: screenWidth * 0.43,
              useRootNavigator: true,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  BorderRadii.size_14,
                ),
              ),
              //  offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(
                  BorderRadii.size_40,
                ),
                thickness: MaterialStateProperty.all(
                  BorderRadii.size_6,
                ),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: BorderRadii.size_40,
              padding: EdgeInsets.only(
                left: BorderRadii.size_14,
                right: BorderRadii.size_14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
