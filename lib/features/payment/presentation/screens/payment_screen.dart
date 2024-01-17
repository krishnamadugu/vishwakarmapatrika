import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vishwakarmapatrika/core/constants/app_images.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/theme/app_colors.dart';
import '../../../../core/constants/theme/border_radii.dart';
import '../../../../core/constants/theme/font_size.dart';
import '../../../../core/constants/theme/theme_constants.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00fafafa),
        elevation: 0,
        title: Text(
          AppStrings.txtConfirmPayment,
          style: const TextStyle(
            fontSize: FontSizes.size_20,
            fontFamily: ThemeConstants.appLobsterTwoFontFamily,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  width: screenWidth,
                  height: screenHeight * 0.26,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(BorderRadii.size_18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.3),
                        offset: const Offset(-2, 6),
                        blurRadius: BorderRadii.size_10,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.txtConfirmCheckout,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: FontSizes.size_20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.txtAmountBePaid,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: FontSizes.size_18,
                              ),
                            ),
                            Text(
                              "\$ 700",
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: FontSizes.size_18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.txtTaxes,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: FontSizes.size_18,
                              ),
                            ),
                            Text(
                              "\$ 28.35",
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: FontSizes.size_18,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.txtTotalPay,
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: FontSizes.size_20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "\$ 728.35",
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: FontSizes.size_20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.txtPaymentMethods,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: FontSizes.size_20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all()),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.creditCardSvg,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppStrings.txtCreditCard,
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: FontSizes.size_20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all()),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.upiIconSvg,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppStrings.txtUpiPayment,
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: FontSizes.size_20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              width: screenWidth,
              alignment: Alignment.center,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: AppColors.primaryColor,
              ),
              child: Text(
                AppStrings.txtPayNow,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontSize: FontSizes.size_24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
