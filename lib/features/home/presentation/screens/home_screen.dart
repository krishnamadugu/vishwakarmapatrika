import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/utils/shared/shared_methods.dart';
import 'package:vishwakarmapatrika/features/home/model/temp_list_model.dart';
import 'package:vishwakarmapatrika/features/home/presentation/bloc/home_bloc.dart';
import 'package:vishwakarmapatrika/features/home/presentation/cubit/home_cubit.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../../model/get_all_profiles_model.dart';
import '../widgets/event_container_widget.dart';
import '../widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  GetAllProfilesModel? getUserProfiles = GetAllProfilesModel();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is HomeInitialState) {
          BlocProvider.of<HomeBloc>(context).add(HomeGetAllProfilesEvent());
        } else if (state is HomeLoadingState) {
          sharedLoadingIndicatorWidget(
              context, screenHeight, screenWidth, AppColors.primaryColor);
        } else if (state is HomeFailureState) {
          Navigator.pop(context);
          showToastMsg(state.errorMsg.toString());
        } else if (state is HomeSuccessState) {
          Navigator.pop(context);
          getUserProfiles = state.getAllProfilesModel;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFAFAFAFA),
          appBar: homeAppBarWidget(
            appTextName: AppStrings.txtAppName,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BlocBuilder<HomeCubit, TempListMode>(
                            builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              context.read<HomeCubit>().onFirstContainerTapped(
                                  !(state.isFirstSelected));
                            },
                            child: Container(
                              height: 30.0,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: state.isFirstSelected
                                    ? AppColors.extraLightRed
                                    : AppColors.white,
                                borderRadius:
                                    BorderRadius.circular(BorderRadii.size_12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.3),
                                    offset: const Offset(0, 4),
                                    blurRadius: BorderRadii.size_18,
                                    spreadRadius: 0.5,
                                  ),
                                ],
                              ),
                              child: const Text(AppStrings.txtMostPopular),
                            ),
                          );
                        }),
                        const SizedBox(
                          width: 20.0,
                        ),
                        BlocBuilder<HomeCubit, TempListMode>(
                            builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              context.read<HomeCubit>().onSecondContainerTapped(
                                  !(state.isSecondSelected));
                            },
                            child: Container(
                              height: 30.0,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: state.isSecondSelected
                                    ? AppColors.extraLightRed
                                    : AppColors.white,
                                borderRadius:
                                    BorderRadius.circular(BorderRadii.size_12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.3),
                                    offset: const Offset(0, 4),
                                    blurRadius: BorderRadii.size_18,
                                    spreadRadius: 0.5,
                                  ),
                                ],
                              ),
                              child: const Text(AppStrings.txtRecentlyVisited),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIl8Nh-RoO-XLKCV6ua42qMEEgTQR0IllqukJp1F3-Hw&s",
                    imageBuilder: (context, imageProvider) =>
                        EventContainerWidget(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      textTheme: textTheme,
                      imgProvider: imageProvider,
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  getUserProfiles != null && getUserProfiles!.data != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: getUserProfiles!.data!.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var itemVal = getUserProfiles!.data![index];
                            var dobVal = itemVal.dob.toString();
                            var currentDate = DateTime.now();
                            var age = yearsBetween(
                                DateTime.parse(dobVal), currentDate);
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: BorderRadii.size_20),
                                  child: sharedContainerProfileWidget(
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
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
