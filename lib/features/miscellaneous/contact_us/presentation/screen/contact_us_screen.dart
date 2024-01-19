import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/utils/shared/shared_methods.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    final TextEditingController emailTextEditingController =
        TextEditingController();
    final TextEditingController questionTextEditingController =
        TextEditingController();
    return Scaffold(
      appBar: sharedAppBarWidget(
        appTextName: AppStrings.txtContactUs,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: SharedTextFieldWidget(
                textEditingController: emailTextEditingController,
                validatorFunction: sharedValidatorFunc,
                textTheme: textTheme,
                hintTxt: "Enter your email id",
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: SharedTextFieldWidget(
                textEditingController: questionTextEditingController,
                validatorFunction: sharedValidatorFunc,
                textTheme: textTheme,
                hintTxt: "Mention Your Problem",
                maxLines: 10,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SharedActionButtonWidget(
              screenWidth: screenWidth,
              textTheme: textTheme,
              btnText: AppStrings.txtSend,
            ),
          ],
        ),
      ),
    );
  }
}
