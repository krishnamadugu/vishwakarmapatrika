import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/theme/app_colors.dart';
import '../../../../core/constants/theme/border_radii.dart';
import '../../../../core/constants/theme/font_size.dart';
import '../../../../core/constants/theme/theme_constants.dart';

AppBar homeAppBarWidget(
    {required String appTextName, void Function()? onPressedFun}) {
  return AppBar(
    backgroundColor: const Color(0x00fafafa),
    elevation: 0,
    title: Text(
      appTextName,
      style: const TextStyle(
        fontSize: FontSizes.size_20,
        fontFamily: ThemeConstants.appLobsterTwoFontFamily,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryColor,
      ),
    ),
    actions: [
      IconButton(
        onPressed: onPressedFun,
        icon: SvgPicture.asset(
          AppIcons.filterIconSvg,
          width: BorderRadii.size_16,
          height: BorderRadii.size_16,
          color: AppColors.primaryColor,
        ),
      ),
      const SizedBox(
        width: BorderRadii.size_8,
      )
    ],
  );
}
