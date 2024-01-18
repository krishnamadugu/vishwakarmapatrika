import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';

import '../../../../core/utils/shared/shared_widgets.dart';

class OtherUserProfileInfoWidgets extends StatelessWidget {
  final List<String> basicDetailValType;
  final List<String> basicDetailValues;
  const OtherUserProfileInfoWidgets({
    super.key,
    required this.basicDetailValType,
    required this.basicDetailValues,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SharedRowDetailContainerWidget(
              basicDetailValType: basicDetailValType,
              textTheme: textTheme,
              basicDetailValues: basicDetailValues,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
