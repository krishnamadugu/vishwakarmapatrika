import 'package:flutter/material.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';

class SupportUsScreen extends StatelessWidget {
  const SupportUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBarWidget(
        appTextName: AppStrings.txtSupportUs,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "In Developmemt",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
