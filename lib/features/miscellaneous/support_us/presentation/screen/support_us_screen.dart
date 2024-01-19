import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';

class SupportUsScreen extends StatelessWidget {
  const SupportUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: sharedAppBarWidget(
        appTextName: AppStrings.txtSupportUs,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.aboutLogoPng,
              height: screenHeight * 0.3,
              width: screenWidth,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              AppStrings.txtSupportUsPrompt,
              style: textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SharedActionButtonWidget(
              screenWidth: screenWidth,
              textTheme: textTheme,
              btnText: AppStrings.txtDonateUs,
            ),
          ],
        ),
      ),
    );
  }
}
