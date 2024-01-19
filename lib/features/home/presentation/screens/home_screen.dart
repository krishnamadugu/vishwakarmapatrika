import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/config/route/route_arguments.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/utils/shared/shared_methods.dart';
import 'package:vishwakarmapatrika/features/home/model/temp_list_model.dart';
import 'package:vishwakarmapatrika/features/home/presentation/bloc/home_bloc.dart';
import 'package:vishwakarmapatrika/features/home/presentation/cubit/home_cubit.dart';
import 'package:vishwakarmapatrika/features/other_user_profile/presentation/bloc/other_profile_bloc.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/theme/font_size.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../../model/get_all_profiles_model.dart';
import '../widgets/event_container_widget.dart';
import '../widgets/home_app_bar_widget.dart';

//ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final String userId;
  HomeScreen({
    required this.userId,
    super.key,
  });

  GetAllProfilesModel? getUserProfiles = GetAllProfilesModel();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    List<String> categoryItems = [
      'category 1',
      'category 2',
      'category 3',
      'category 4',
      'category 5',
    ];
    List<String> subCategoryItems = [
      'sub category 1',
      'sub category 2',
      'sub category 3',
      'sub category 4',
      'sub category 5',
      'sub category 1',
      'sub category 2',
      'sub category 3',
      'sub category 4',
      'sub category 5',
    ];
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
            onPressedFun: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                    margin: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.txtFilter,
                                style: textTheme.bodyLarge,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  AppStrings.txtClose,
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 10.0,
                            ),
                            child: Divider(),
                          ),
                          SingleChildScrollView(
                            child: BlocBuilder<HomeCubit, TempListMode>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            width: screenWidth * 0.4,
                                            height: screenHeight * 0.5,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4),
                                            color: AppColors.lightRed
                                                .withOpacity(0.1),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: ClampingScrollPhysics(),
                                              itemCount: categoryItems.length,
                                              itemBuilder: (context, index) {
                                                return SingleChildScrollView(
                                                  child: InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  HomeCubit>(
                                                              context)
                                                          .onCategoryTapped(
                                                              index);
                                                    },
                                                    child: Container(
                                                      color:
                                                          state.categoryIndexTapped ==
                                                                  index
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .lightRed
                                                                  .withOpacity(
                                                                      0.1),
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child: Text(
                                                        categoryItems[index],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                        maxLines: 2,
                                                        style: textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: SizedBox(
                                            height: screenHeight * 0.5,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    categoryItems[state
                                                        .categoryIndexTapped],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    style: textTheme.bodyMedium
                                                        ?.copyWith(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.5,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            ClampingScrollPhysics(),
                                                        itemCount:
                                                            subCategoryItems
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return CheckboxListTile(
                                                            title: Text(
                                                              subCategoryItems[
                                                                  index],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              softWrap: true,
                                                              maxLines: 2,
                                                              style: textTheme
                                                                  .bodyMedium
                                                                  ?.copyWith(
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                            value: state.selectedListIndex !=
                                                                        null &&
                                                                    state
                                                                        .selectedListIndex!
                                                                        .contains(
                                                                            index)
                                                                ? true
                                                                : false,
                                                            onChanged:
                                                                (newValue) {
                                                              var tempList = state
                                                                  .selectedListIndex;
                                                              if (tempList !=
                                                                  null) {
                                                                if (newValue ==
                                                                    true) {
                                                                  tempList.add(
                                                                      index);
                                                                  BlocProvider.of<
                                                                              HomeCubit>(
                                                                          context)
                                                                      .onSubCategoryTapped(
                                                                          tempList);
                                                                } else {
                                                                  tempList
                                                                      .remove(
                                                                          index);
                                                                  BlocProvider.of<
                                                                              HomeCubit>(
                                                                          context)
                                                                      .onSubCategoryTapped(
                                                                          tempList);
                                                                }
                                                              } else {
                                                                tempList = [
                                                                  index
                                                                ];
                                                                BlocProvider.of<
                                                                            HomeCubit>(
                                                                        context)
                                                                    .onSubCategoryTapped(
                                                                        tempList);
                                                              }
                                                            },
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading, //  <-- leading Checkbox
                                                          );
                                                        }),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(12.0),
                                margin: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  color: AppColors.primaryColor,
                                ),
                                child: Text(
                                  "show  results",
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: AppColors.white,
                                    fontSize: FontSizes.size_16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              );
            },
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
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.otherUserProfileScreen,
                                        arguments: OtherUserProfileArguments(
                                          loggedUserId: userId,
                                          otherUserId: getUserProfiles!
                                              .data![index].id
                                              .toString(),
                                        ),
                                      );
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
