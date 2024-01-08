import 'package:flutter/material.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/features/home/model/temp_list_model.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../widgets/event_container_widget.dart';
import '../widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final userName;
  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    Color activeContainerColor = AppColors.primaryColor;
    Color inActiveContainerColor = AppColors.white;
    String containerVal = "Most Popular";

    List items = [
      TempListMode(isSelected: false, labelTxt: "Item 1"),
      TempListMode(isSelected: false, labelTxt: "Item 2"),
      TempListMode(isSelected: false, labelTxt: "Item 3"),
    ];

    const String userName = "Anand vihar";
    const String age = "25years";
    const String place = "Delhi, India";
    const String occupation = "Software Engineer";

    return Scaffold(
      backgroundColor: const Color(0xFAFAFAFA),
      appBar: homeAppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventContainerWidget(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  textTheme: textTheme),
              const SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: BorderRadii.size_20),
                        child: sharedContainerProfileWidget(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          userName: userName,
                          textTheme: textTheme,
                          age: age,
                          place: place,
                          occupation: occupation,
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
        ),
      ),
    );
  }
}
