import 'package:flutter/material.dart';

import '../../../../config/route/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/theme/app_colors.dart';
import '../../../../core/constants/theme/border_radii.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../../../home/presentation/widgets/home_app_bar_widget.dart';

class ShortlistedScreen extends StatelessWidget {
  const ShortlistedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    const String userName = "Anand vihar";
    const String age = "25years";
    const String place = "Delhi, India";
    const String occupation = "Software Engineer";

    return Scaffold(
        backgroundColor: const Color(0xFAFAFAFA),
        appBar: homeAppBarWidget(
          appTextName: AppStrings.txtShortListedProfiles,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: BorderRadii.size_20),
                        child: sharedContainerProfileWidget(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.otherUserProfileScreen);
                          },
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          userName: userName,
                          textTheme: textTheme,
                          age: age,
                          place: place,
                          occupation: occupation,
                          containerBackgroundColor: index.isEven
                              ? AppColors.lightBlue
                              : AppColors.extraLightRed,
                        ),
                      ),
                      const SizedBox(
                        height: BorderRadii.size_30,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ));
  }
}
