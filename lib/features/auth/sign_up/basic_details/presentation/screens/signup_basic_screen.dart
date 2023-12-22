import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/theme/border_radii.dart';
import '../../../../../../core/utils/shared/shared_methods.dart';
import '../../../../../../core/utils/shared/shared_widgets.dart';

class SignUpBasicScreen extends StatelessWidget {
  SignUpBasicScreen({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final List<String> list = ['item 1', 'item 2', 'item 3', 'item 4'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          margin: const EdgeInsets.all(BorderRadii.size_20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpHeaderWidget(
                  headerText: AppStrings.txtSignUp,
                  textTheme: textTheme,
                ),
                const SizedBox(
                  height: BorderRadii.size_20,
                ),
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: BorderRadii.size_50,
                      backgroundColor: AppColors.grey,
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.primaryColor,
                        size: BorderRadii.size_30,
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
                      child: DropdownMenu<String>(
                        hintText: "Select your sub caste",
                        menuStyle: MenuStyle(),
                        width: screenWidth * 0.4,
                        onSelected: (String? value) {},
                        dropdownMenuEntries:
                            list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: DropdownMenu<String>(
                        hintText: "Select your sub caste",
                        width: screenWidth * 0.4,
                        onSelected: (String? value) {},
                        dropdownMenuEntries:
                            list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
