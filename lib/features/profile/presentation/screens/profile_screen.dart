import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vishwakarmapatrika/config/route/app_routes.dart';
import 'package:vishwakarmapatrika/core/constants/app_constants.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/border_radii.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';
import '../../../../core/constants/app_images.dart';
import '../../../auth/sign_in/model/signin_model.dart';

class ProfileScreen extends StatelessWidget {
  final SignInModel signInModel;
  ProfileScreen({super.key, required this.signInModel});

  final List<String> accountItems = [
    AppStrings.txtUpdateProfile,
    AppStrings.txtChangePassword,
  ];
  final List<String> accountItemIcons = [
    AppImages.editProfileImg,
    AppImages.lockImg,
  ];
  final List<String> miscellaneousItems = [
    AppStrings.txtAboutUs,
    AppStrings.txtContactUs,
    AppStrings.txtSupportUs,
    AppStrings.txtDeleteAccount,
    AppStrings.txtLogOut,
  ];
  final List<String> miscellaneousItemIcons = [
    AppImages.aboutUsImg,
    AppImages.contactUsImg,
    AppImages.supportUsImg,
    AppImages.deleteImg,
    AppImages.signOutImg,
  ];
  final List<String> navigatorAccountFunctions = [
    AppRoutes.updateProfileScreen,
    AppRoutes.changePasswordScreen,
  ];
  final List<String> navigatorMiscellaneousFunctions = [
    AppRoutes.aboutUsScreen,
    AppRoutes.contactUsScreen,
    AppRoutes.supportUsScreen,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    String userName = signInModel.data!.profile!.name.toString();

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              CachedNetworkImage(
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIl8Nh-RoO-XLKCV6ua42qMEEgTQR0IllqukJp1F3-Hw&s",
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 60,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                userName,
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                height: screenHeight,
                width: screenWidth,
                margin: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.txtAccount,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.23,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: accountItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, navigatorAccountFunctions[index]);
                            },
                            child: SharedProfileOptionWidget(
                              index: index,
                              screenWidth: screenWidth,
                              accountItemIcons: accountItemIcons,
                              accountItems: accountItems,
                              textTheme: textTheme,
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      AppStrings.txtMiscellaneous,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: miscellaneousItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (index == 3) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.all(8.0),
                                      title: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              AppStrings.txtDeleteMyAccount,
                                              style: textTheme.titleLarge
                                                  ?.copyWith(
                                                fontSize: FontSizes.size_20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18,
                                            ),
                                            Text(
                                              AppStrings.txtDeletePrompt,
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(
                                                fontSize: FontSizes.size_16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              width: screenWidth,
                                              height: BorderRadii.size_58,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  BorderRadii.size_18,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  AppStrings.txtDeleteMyAccount,
                                                  style: textTheme.titleLarge
                                                      ?.copyWith(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: FontSizes.size_24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: screenWidth,
                                                height: BorderRadii.size_58,
                                                decoration: BoxDecoration(
                                                  color: AppColors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    BorderRadii.size_18,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppStrings.txtNoTakeMeBack,
                                                    style: textTheme.titleLarge
                                                        ?.copyWith(
                                                      color: AppColors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          FontSizes.size_24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                    );
                                  });
                            } else if (index == 4) {
                              sharedPref.logout();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.splashScreen,
                                (route) => false,
                              );
                            } else {
                              Navigator.pushNamed(context,
                                  navigatorMiscellaneousFunctions[index]);
                            }
                          },
                          child: SharedProfileOptionWidget(
                            index: index,
                            screenWidth: screenWidth,
                            accountItemIcons: miscellaneousItemIcons,
                            accountItems: miscellaneousItems,
                            textTheme: textTheme,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SharedProfileOptionWidget extends StatelessWidget {
  const SharedProfileOptionWidget(
      {super.key,
      required this.screenWidth,
      required this.accountItemIcons,
      required this.accountItems,
      required this.textTheme,
      required this.index});

  final double screenWidth;
  final List<String> accountItemIcons;
  final List<String> accountItems;
  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(BorderRadii.size_12),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                offset: const Offset(-2, 1),
                blurRadius: BorderRadii.size_5,
                spreadRadius: 0.2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    accountItemIcons[index],
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    accountItems[index],
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: FontSizes.size_18,
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(BorderRadii.size_8)),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 14.0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
