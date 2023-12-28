import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/features/home/model/temp_list_model.dart';
import 'package:vishwakarmapatrika/features/home/presentation/cubit/home_cubit.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    // final homeOverAllCubit = BlocProvider.of<HomeOverallCubit>(context);

    Color activeContainerColor = AppColors.primaryColor;
    Color inActiveContainerColor = AppColors.white;
    String containerVal = "Most Popular";

    List items = [
      TempListMode(isSelected: false, labelTxt: "Item 1"),
      TempListMode(isSelected: false, labelTxt: "Item 2"),
      TempListMode(isSelected: false, labelTxt: "Item 3"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFAFAFAFA),
      appBar: homeAppBarWidget(),
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          margin: const EdgeInsets.all(BorderRadii.size_20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BlocBuilder<HomeOverallCubit, HomeClassOverall>(
                        builder:
                            (BuildContext context, HomeClassOverall state) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  //  homeOverAllCubit.checkUncheckCart(index);
                                },
                                child: SharedShadowContainerWidget(
                                  selectedColor:
                                      state.items!.elementAt(index).isSelected
                                          ? activeContainerColor
                                          : inActiveContainerColor,
                                  containerVal:
                                      state.items!.elementAt(index).labelTxt,
                                  textTheme: textTheme,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          );
                        },
                      );
                    },
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
