import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vishwakarmapatrika/core/constants/app_images.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/domain/about_us_model.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/domain/our_teams_model.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/presentation/bloc/about_us_bloc.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/presentation/bloc/about_us_state.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/shared/shared_widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    AboutUsModel getAboutUsDetails = AboutUsModel();
    OurTeamsModel getOurTeamsDetails = OurTeamsModel();

    return BlocConsumer<AboutBloc, AboutUsState>(
        listener: (BuildContext context, AboutUsState state) {
      if (state is AboutUsInitialState) {
        BlocProvider.of<AboutBloc>(context).add(AboutUsCallApiEvent());
      } else if (state is AboutUsLoadingState) {
        sharedLoadingIndicatorWidget(
            context, screenHeight, screenWidth, AppColors.primaryColor);
      } else if (state is AboutUsFailureState) {
        Navigator.pop(context);
        showToastMsg(state.errorMsg.toString());
      } else if (state is AboutUsSuccessState) {
        Navigator.pop(context);
        getAboutUsDetails = state.getAboutUsDetails;
        getOurTeamsDetails = state.getOurTeamDetails;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: sharedAppBarWidget(
          appTextName: AppStrings.txtAboutUs,
        ),
        body: getOurTeamsDetails.data != null || getAboutUsDetails.data != null
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.aboutLogoPng,
                      height: screenHeight * 0.3,
                      width: screenWidth,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        getAboutUsDetails.data![0].mobileAppDescription
                            .toString(),
                        style: textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        "Our Team",
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: getOurTeamsDetails.data![0].imageUrl
                                      .toString(),
                                  width: double.infinity,
                                  height: screenHeight * 0.2,
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) =>
                                      const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.error_outline),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Image Not Uploaded",
                                          textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  ),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  filterQuality: FilterQuality.medium,
                                ),
                                Text(
                                  getOurTeamsDetails.data![0].title.toString(),
                                  style: textTheme.headlineLarge,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  getOurTeamsDetails.data![0].subtitle
                                      .toString(),
                                  style: textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: getOurTeamsDetails.data![1].imageUrl
                                      .toString(),
                                  width: double.infinity,
                                  height: screenHeight * 0.2,
                                  fit: BoxFit.fill,
                                  errorWidget: (context, url, error) =>
                                      const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.error_outline),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Image Not Uploaded",
                                          textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  ),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  filterQuality: FilterQuality.medium,
                                ),
                                Text(
                                  getOurTeamsDetails.data![1].title.toString(),
                                  style: textTheme.headlineLarge,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  getOurTeamsDetails.data![1].subtitle
                                      .toString(),
                                  style: textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth,
                            child: Text(
                              "Copyright  2024 @ all rights reserved",
                              style: textTheme.titleMedium?.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  FontAwesomeIcons.instagram,
                                  size: 20,
                                ),
                                Icon(
                                  FontAwesomeIcons.facebook,
                                  size: 20,
                                ),
                                Icon(
                                  FontAwesomeIcons.youtube,
                                  size: 20,
                                ),
                                Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: Text(AppStrings.txtNoDataFound),
              ),
      );
    });
  }
}
