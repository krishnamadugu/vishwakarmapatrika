import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';
import 'package:vishwakarmapatrika/core/services/api_services/native_api_service.dart';
import 'package:vishwakarmapatrika/core/utils/shared/shared_methods.dart';
import '../../../features/auth/sign_up/basic_details/presentation/cubit/signup_basic_cubit.dart';
import '../../constants/app_images.dart';
import '../../constants/app_strings.dart';

class SharedTextFieldWidget extends StatelessWidget {
  const SharedTextFieldWidget({
    super.key,
    this.suffixIconWidget = const SizedBox(
      width: 0,
    ),
    required this.textEditingController,
    required this.validatorFunction,
    required this.textTheme,
    required this.hintTxt,
    this.keyBoardTypeVal,
    this.obsTxtVal = false,
    this.maxLines,
  });

  final TextEditingController textEditingController;
  final String? Function(String?)? validatorFunction;
  final TextTheme textTheme;
  final String hintTxt;
  final TextInputType? keyBoardTypeVal;
  final Widget suffixIconWidget;
  final bool obsTxtVal;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: BorderRadii.size_10),
          child: Text(
            hintTxt,
            style: textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: textEditingController,
          validator: validatorFunction,
          style: textTheme.labelSmall?.copyWith(
            fontSize: FontSizes.size_20,
          ),
          maxLines: maxLines ?? 1,
          keyboardType: keyBoardTypeVal,
          obscureText: obsTxtVal,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: BorderRadii.size_16,
              horizontal: BorderRadii.size_30,
            ),
            errorStyle: textTheme.labelSmall?.copyWith(
              fontSize: FontSizes.size_14,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            hintText: hintTxt,
            hintStyle: textTheme.labelSmall?.copyWith(
              fontSize: FontSizes.size_20,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                BorderRadii.size_20,
              ),
              borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor,
              ),
            ),
            enabledBorder: inputTextFieldBorder(),
            errorBorder: inputTextFieldBorder(),
            focusedBorder: inputTextFieldBorder(),
            suffixIcon: suffixIconWidget,
          ),
        ),
      ],
    );
  }
}

class ForgotPasswordHeaderWidget extends StatelessWidget {
  const ForgotPasswordHeaderWidget({
    super.key,
    required this.textTheme,
    required this.headerText,
  });

  final TextTheme textTheme;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.navigate_before,
                size: 26.0,
              ),
              Text(
                AppStrings.txtBack,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: FontSizes.size_20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text(
            headerText,
            style: textTheme.titleLarge?.copyWith(
              color: AppColors.primaryColor,
              fontSize: FontSizes.size_42,
            ),
          ),
        ),
      ],
    );
  }
}

class SharedRichTextWidget extends StatelessWidget {
  const SharedRichTextWidget({
    super.key,
    required this.textTheme,
    required this.signUpOptionTapped,
    required this.text1,
    required this.text2,
  });

  final TextTheme textTheme;
  final void Function()? signUpOptionTapped;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: textTheme.bodySmall?.copyWith(
              fontSize: FontSizes.size_18,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()..onTap = signUpOptionTapped,
            style: textTheme.bodySmall?.copyWith(
              fontSize: FontSizes.size_18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({
    super.key,
    required this.textTheme,
    required this.headerText,
  });

  final TextTheme textTheme;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.navigate_before,
                size: 26.0,
              ),
              Text(
                AppStrings.txtBack,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: FontSizes.size_20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text(
            headerText,
            style: textTheme.titleLarge?.copyWith(
              color: AppColors.primaryColor,
              fontSize: FontSizes.size_24,
            ),
          ),
        ),
      ],
    );
  }
}

showToastMsg(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.white,
      fontSize: 14.0);
}

class SharedDropDownWidget extends StatelessWidget {
  const SharedDropDownWidget({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: BorderRadii.size_10),
            child: Text(
              hintText,
              style: textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 6),
          DropdownButtonHideUnderline(
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
                width: screenWidth * 0.4,
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
        ],
      ),
    );
  }
}

class SharedContainerSignUpWidget extends StatelessWidget {
  const SharedContainerSignUpWidget({
    super.key,
    required this.screenWidth,
    required this.textTheme,
    required this.labelTxt,
    required this.labelIcon,
    required this.containerTapped,
  });

  final double screenWidth;
  final String labelTxt;
  final Widget labelIcon;
  final TextTheme textTheme;
  final void Function()? containerTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: containerTapped,
      child: Container(
        width: screenWidth * 0.5,
        margin: const EdgeInsets.symmetric(
          horizontal: BorderRadii.size_10,
        ),
        padding: const EdgeInsets.all(
          BorderRadii.size_12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            BorderRadii.size_14,
          ),
          border: Border.all(
            color: AppColors.lightRed,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                labelTxt,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: FontSizes.size_14,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(
              width: BorderRadii.size_14,
            ),
            Expanded(
              flex: 1,
              child: labelIcon,
            ),
          ],
        ),
      ),
    );
  }
}

class SharedActionButtonWidget extends StatelessWidget {
  const SharedActionButtonWidget({
    super.key,
    required this.screenWidth,
    required this.textTheme,
    required this.btnText,
  });

  final double screenWidth;
  final TextTheme textTheme;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: BorderRadii.size_58,
      margin: const EdgeInsets.all(
        BorderRadii.size_18,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(
          BorderRadii.size_18,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: FontSizes.size_24,
          ),
        ),
      ),
    );
  }
}

class SharedSignUpDropDownWidget extends StatelessWidget {
  const SharedSignUpDropDownWidget({
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
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: textTheme.labelSmall?.copyWith(
              fontSize: FontSizes.size_20,
              fontWeight: FontWeight.w300,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: onChangedFun,
          buttonStyleData: ButtonStyleData(
            height: screenHeight * 0.08,
            width: screenWidth * 0.84,
            padding: const EdgeInsets.symmetric(
              horizontal: BorderRadii.size_14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                BorderRadii.size_20,
              ),
              border: Border.all(
                color: AppColors.lightRed,
              ),
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
            ),
            iconSize: BorderRadii.size_28,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: screenHeight * 0.2,
            width: screenWidth * 0.84,
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
    );
  }
}

class SharedImagePicker {
  final ImagePicker _picker = ImagePicker();
  late CroppedFile imageFile;
  late File croppedImgFile;
  String imagePath = "";
  String imageUrl = "";

  getFromGallery(BuildContext context) async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    debugPrint(photo?.path.toString());
    try {
      if (!context.mounted) return;
      _cropImage(photo?.path, context);
    } catch (e) {
      debugPrint(e.toString());
    }

    if (!context.mounted) return;
    Navigator.pop(context);
  }

  getFromCamera(BuildContext context) async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    debugPrint(photo?.path.toString());
    try {
      if (!context.mounted) return;
      _cropImage(photo?.path, context);
    } catch (e) {
      debugPrint(e.toString());
    }

    if (!context.mounted) return;
    Navigator.pop(context);
  }

  _cropImage(filePath, BuildContext context) async {
    CroppedFile? croppedImage;
    try {
      croppedImage = await ImageCropper().cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    if (croppedImage != null) {
      croppedImgFile =
          await NativeApiService.getImgDirPath(File(croppedImage.path));
      imagePath = croppedImgFile.path;
      if (!context.mounted) return;
      BlocProvider.of<SignupBasicCubit>(context).userImg(imagePath);
      debugPrint(
          "image path updated ${BlocProvider.of<SignupBasicCubit>(context).state.imgUrl}");
    }
  }

  showAttachmentBottomSheet(BuildContext context, TextTheme txtTheme) {
    showModalBottomSheet(
      backgroundColor: AppColors.lightRed,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: AppColors.white,
                ),
                title: Text(
                  AppStrings.txtUploadCamera,
                  style: txtTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                onTap: () {
                  try {
                    getFromCamera(context);
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.image,
                  color: AppColors.white,
                ),
                title: Text(
                  AppStrings.txtUploadGallery,
                  style: txtTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                onTap: () {
                  try {
                    getFromGallery(context);
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SharedShadowContainerWidget extends StatelessWidget {
  const SharedShadowContainerWidget({
    super.key,
    required this.selectedColor,
    required this.containerVal,
    required this.textTheme,
  });

  final Color selectedColor;
  final String containerVal;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Text(
        containerVal,
        style: textTheme.bodyMedium?.copyWith(
          color: AppColors.black,
          fontSize: FontSizes.size_14,
        ),
      ),
    );
  }
}

Future<dynamic> sharedLoadingIndicatorWidget(BuildContext context,
    double screenHeight, double screenWidth, Color indicatorColor) {
  return showDialog(
    context: context,
    builder: (context) => SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Center(
        child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: CircularProgressIndicator(
            color: indicatorColor,
          ),
        ),
      ),
    ),
  );
}

class sharedContainerProfileWidget extends StatelessWidget {
  const sharedContainerProfileWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.userName,
    required this.textTheme,
    required this.age,
    required this.place,
    required this.occupation,
    required this.containerBackgroundColor,
  });

  final double screenWidth;
  final double screenHeight;
  final String userName;
  final TextTheme textTheme;
  final String age;
  final String place;
  final String occupation;
  final Color containerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          color: containerBackgroundColor,
          borderRadius: BorderRadius.circular(BorderRadii.size_18),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              offset: const Offset(-2, 8),
              blurRadius: BorderRadii.size_18,
              spreadRadius: 1,
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, boxConstraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.22,
                  height: boxConstraints.maxHeight * 0.7,
                  margin: const EdgeInsets.only(left: 18, top: 18),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.demoProfileImg),
                    ),
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(BorderRadii.size_14),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(BorderRadii.size_18),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSizes.size_24,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "$age years old | $place",
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: FontSizes.size_18,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            occupation,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: FontSizes.size_18,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: BorderRadii.size_8,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.only(top: BorderRadii.size_14),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
