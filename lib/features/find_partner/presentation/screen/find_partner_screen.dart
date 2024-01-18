import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/features/find_partner/model/get_all_partners_model.dart';
import 'package:vishwakarmapatrika/features/find_partner/presentation/cubit/find_partner_cubit.dart';

import '../../../../config/route/app_routes.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/theme/border_radii.dart';
import '../../../../core/utils/shared/shared_methods.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../../../home/presentation/widgets/home_app_bar_widget.dart';
import '../../model/temp_choose_partner_model.dart';
import '../bloc/find_partner_bloc.dart';

//ignore: must_be_immutable
class FindPartnerScreen extends StatelessWidget {
  FindPartnerScreen({super.key});

  GetAllPartnerDetailsModel? getPartnerProfiles = GetAllPartnerDetailsModel();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    List<String> items = [
      AppStrings.txtGroom,
      AppStrings.txtBride,
    ];

    List<String> itemsSvg = [
      AppImages.groomIcon,
      AppImages.brideIcon,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFAFAFAFA),
      appBar: homeAppBarWidget(
        appTextName: AppStrings.txtChooseYourPartner,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              width: screenWidth,
              height: 50.0,
              decoration: const BoxDecoration(
                color: AppColors.extraLightRed,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.txtIamLookingFor,
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  BlocBuilder<FindPartnerCubit, TempChoosePartnerModel>(
                    builder: (context, state) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: BorderRadii.size_10,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              items: items
                                  .map(
                                    (String item) => item.startsWith('-')
                                        ? DropdownMenuItem<String>(
                                            value: item,
                                            enabled: false,
                                            child: Row(
                                              children: [
                                                Text(
                                                  item,
                                                  style: TextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          )
                                        : DropdownMenuItem<String>(
                                            value: item,
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  item.contains(items[0])
                                                      ? itemsSvg[0]
                                                      : itemsSvg[1],
                                                  color: AppColors.white,
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  item,
                                                  style: const TextStyle(
                                                    color: AppColors.white,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                  )
                                  .toList(),
                              value: state.selectedPartner,
                              onChanged: (value) {
                                BlocProvider.of<FindPartnerCubit>(context)
                                    .onPartnerSelected(value.toString());
                                value == AppStrings.txtBride
                                    ? BlocProvider.of<FindPartnerBloc>(context)
                                        .add(FindBridePartnerEvent())
                                    : BlocProvider.of<FindPartnerBloc>(context)
                                        .add(FindGroomPartnerEvent());
                              },
                              buttonStyleData: ButtonStyleData(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.32,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: BorderRadii.size_14,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    BorderRadii.size_14,
                                  ),
                                  color: AppColors.lightRed,
                                  // color: Colors.redAccent,
                                ),
                                //elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.white,
                                ),
                                iconSize: BorderRadii.size_28,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: screenHeight * 0.2,
                                width: screenWidth * 0.35,
                                useRootNavigator: true,
                                decoration: BoxDecoration(
                                  color: AppColors.lightRed,
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
                                  thumbVisibility:
                                      MaterialStateProperty.all(true),
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
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer<FindPartnerBloc, FindPartnerState>(
              listener: (context, state) {
                if (state is FindPartnerInitialState) {
                  BlocProvider.of<FindPartnerBloc>(context)
                      .add(FindGroomPartnerEvent());
                } else if (state is FindPartnerLoadingState) {
                  sharedLoadingIndicatorWidget(context, screenHeight,
                      screenWidth, AppColors.primaryColor);
                } else if (state is FindPartnerFailureState) {
                  Navigator.pop(context);
                  showToastMsg(state.errorMsg.toString());
                } else if (state is FindPartnerSuccessState) {
                  Navigator.pop(context);
                  getPartnerProfiles = state.getAllPartnerDetailsModel;
                }
              },
              builder: (context, state) {
                return getPartnerProfiles != null &&
                        getPartnerProfiles!.data != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: getPartnerProfiles!.data!.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var itemVal = getPartnerProfiles!.data![index];
                          var dobVal = itemVal.dob.toString();
                          var currentDate = DateTime.now();
                          var age =
                              yearsBetween(DateTime.parse(dobVal), currentDate);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: BorderRadii.size_20),
                                child: sharedContainerProfileWidget(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        AppRoutes.otherUserProfileScreen);
                                  },
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                  userName: itemVal.name.toString(),
                                  textTheme: textTheme,
                                  age: age.toString(),
                                  place: itemVal.city.toString(),
                                  occupation: itemVal.occupation.toString(),
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
                      )
                    : SizedBox(
                        width: screenWidth,
                        height: screenHeight * 0.4,
                        child: const Center(
                          child: Text(AppStrings.txtNoDataFound),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
