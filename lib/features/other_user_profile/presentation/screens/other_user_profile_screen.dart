import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vishwakarmapatrika/config/route/app_routes.dart';
import 'package:vishwakarmapatrika/core/constants/theme/app_colors.dart';
import 'package:vishwakarmapatrika/core/constants/theme/font_size.dart';
import 'package:vishwakarmapatrika/features/other_user_profile/presentation/widgets/other_profile_details.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/theme/border_radii.dart';
import '../../../../core/utils/shared/shared_widgets.dart';
import '../../model/other_user_profile_model.dart';
import '../bloc/other_profile_bloc.dart';

class OtherUserProfileScreen extends StatefulWidget {
  const OtherUserProfileScreen({
    Key? key,
    required this.loggedUserId,
    required this.otherUserId,
  }) : super(key: key);

  final String loggedUserId;
  final String otherUserId;

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<OtherUserProfileScreen>
    with TickerProviderStateMixin {
  late CarouselController carouselController;
  late TabController tabController;
  late bool isProfileLiked;
  late int currentIndexPage;
  late OtherProfileModel otherProfileModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OtherProfileBloc>(context).add(OtherProfileGetDataEvent(
      loggedUserId: widget.loggedUserId,
      otherUserId: widget.otherUserId,
    ));
    carouselController = CarouselController();
    tabController = TabController(length: 6, vsync: this);
    isProfileLiked = false;
    currentIndexPage = 0;
    otherProfileModel = OtherProfileModel();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    List<String> imgUrl = [
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ];

    return BlocConsumer<OtherProfileBloc, OtherProfileState>(
      listener: (context, state) {
        if (state is OtherProfileInitialState) {
          BlocProvider.of<OtherProfileBloc>(context)
              .add(OtherProfileGetDataEvent(
            loggedUserId: widget.loggedUserId,
            otherUserId: widget.otherUserId,
          ));
        } else if (state is OtherProfileLoadingState) {
          sharedLoadingIndicatorWidget(
              context, screenHeight, screenWidth, AppColors.primaryColor);
        } else if (state is OtherProfileFailureState) {
          Navigator.pop(context);
          showToastMsg(state.errorMsg.toString());
        } else if (state is OtherProfileSuccessState) {
          Navigator.pop(context);
          otherProfileModel = state.getOtherUserProfileData;
        }
      },
      builder: (context, state) {
        return otherProfileModel.data != null
            ? SafeArea(
                child: Scaffold(
                  body: SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.3,
                            child: Stack(
                              children: [
                                CarouselSlider.builder(
                                  carouselController: carouselController,
                                  itemCount: imgUrl.length,
                                  itemBuilder: (context, index, pageIndex) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(imgUrl[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: screenHeight * 0.3,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndexPage = index;
                                      });
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      carouselController.nextPage();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      carouselController.previousPage();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: DotsIndicator(
                                    dotsCount: imgUrl.length,
                                    position: currentIndexPage,
                                    decorator: const DotsDecorator(
                                      activeColor: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 30,
                                      padding: const EdgeInsets.all(8.0),
                                      margin: const EdgeInsets.only(
                                          top: 20.0, left: 20.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.7,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isProfileLiked = !isProfileLiked;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.all(20),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                                BorderRadii.size_50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.3),
                                                offset: const Offset(-2, 8),
                                                blurRadius: BorderRadii.size_18,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: isProfileLiked
                                              ? const Icon(
                                                  Icons.favorite_outlined,
                                                  color: Colors.red,
                                                  size: 25.0,
                                                )
                                              : const Icon(
                                                  Icons.favorite_outline,
                                                  size: 25.0,
                                                ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.all(20),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                                BorderRadii.size_50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.3),
                                                offset: const Offset(-2, 8),
                                                blurRadius: BorderRadii.size_18,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.share,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.all(20),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                                BorderRadii.size_50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.3),
                                                offset: const Offset(-2, 8),
                                                blurRadius: BorderRadii.size_18,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.error_outline,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              otherProfileModel.data!.name
                                                  .toString(),
                                              style: textTheme.headlineLarge,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "${otherProfileModel.data!.age.toString()} yrs old | ${otherProfileModel.data!.state.toString()}",
                                              style: textTheme.headlineSmall,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            otherProfileModel.data!.payment ==
                                                    '0'
                                                ? launchUrl(
                                                    Uri.parse(
                                                        "tel://+91${otherProfileModel.data!.mobile}"),
                                                  )
                                                : Navigator.pushNamed(context,
                                                    AppRoutes.paymentScreen);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(20.0),
                                            margin: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 20,
                                                bottom: 20.0,
                                                right: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              color: AppColors.primaryColor,
                                            ),
                                            child: SvgPicture.asset(
                                              AppImages.contactIconSvg,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.5,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: TabBar(
                                            indicatorSize:
                                                TabBarIndicatorSize.tab,
                                            tabAlignment: TabAlignment.start,
                                            isScrollable: true,
                                            controller: tabController,
                                            indicatorColor:
                                                AppColors.primaryColor,
                                            labelStyle:
                                                textTheme.titleSmall?.copyWith(
                                              color: AppColors.primaryColor,
                                              fontSize: FontSizes.size_20,
                                            ),
                                            labelColor: AppColors.primaryColor,
                                            unselectedLabelColor:
                                                AppColors.black,
                                            unselectedLabelStyle:
                                                textTheme.titleSmall?.copyWith(
                                              fontSize: FontSizes.size_18,
                                            ),
                                            tabs: const [
                                              Text(AppStrings.txtBasicDetails),
                                              Text(AppStrings
                                                  .txtAcademicDetails),
                                              Text(AppStrings.txtFamilyDetails),
                                              Text(AppStrings.txtAboutMe),
                                              Text(
                                                  AppStrings.txtAddressDetails),
                                              Text(AppStrings.txtPartnerPrefs),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: TabBarView(
                                            controller: tabController,
                                            children: [
                                              OtherUserProfileInfoWidgets(
                                                basicDetailValType: [
                                                  AppStrings.txt_Gotra,
                                                  AppStrings.txt_DOB,
                                                  AppStrings.txt_TOB,
                                                  AppStrings.txt_Religion,
                                                  AppStrings.txt_Manglik,
                                                  AppStrings.txt_Marital,
                                                  AppStrings.txt_CreatedBy,
                                                  AppStrings.txt_Hobbies,
                                                ],
                                                basicDetailValues: [
                                                  (otherProfileModel.data!.gotra
                                                      .toString()),
                                                  otherProfileModel.data!.dob
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.birthTime
                                                      .toString(),
                                                  AppStrings.txt_Religion,
                                                  otherProfileModel
                                                      .data!.manglik
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.maritalStatus
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.profileBy
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.hobbies
                                                      .toString(),
                                                ],
                                              ),
                                              OtherUserProfileInfoWidgets(
                                                basicDetailValType: [
                                                  AppStrings.txt_Education,
                                                  AppStrings
                                                      .txt_EducaitonDetails,
                                                  AppStrings.txt_Occupation,
                                                  AppStrings
                                                      .txt_OccupationDetails,
                                                ],
                                                basicDetailValues: [
                                                  otherProfileModel
                                                      .data!.education
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.educationDetails
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.occupation
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.occupationDetails
                                                      .toString(),
                                                ],
                                              ),
                                              OtherUserProfileInfoWidgets(
                                                basicDetailValType: [
                                                  AppStrings.txt_FatherName,
                                                  AppStrings
                                                      .txt_FatherOccupation,
                                                  AppStrings.txt_MotherName,
                                                  AppStrings
                                                      .txt_MotherOccupation,
                                                  AppStrings.txt_BrotherMarried,
                                                  AppStrings
                                                      .txt_BrotherUnmarried,
                                                  AppStrings.txt_SisterMarried,
                                                  AppStrings
                                                      .txt_SisterUnMarried,
                                                ],
                                                basicDetailValues: [
                                                  otherProfileModel
                                                      .data!.fatherName
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.fatherOccupation
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.motherName
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.motherOccupation
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.bMarried
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.bUnmarried
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.sMarried
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.sUnmarried
                                                      .toString(),
                                                ],
                                              ),
                                              SingleChildScrollView(
                                                physics:
                                                    ClampingScrollPhysics(),
                                                child: Container(
                                                  margin: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "About",
                                                        style: textTheme
                                                            .headlineLarge,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        "abo" * 100,
                                                        style: textTheme
                                                            .titleMedium,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              OtherUserProfileInfoWidgets(
                                                basicDetailValType: [
                                                  AppStrings.txt_Address,
                                                  AppStrings.txt_State,
                                                  AppStrings.txt_City,
                                                  AppStrings.txt_Location,
                                                ],
                                                basicDetailValues: [
                                                  otherProfileModel
                                                      .data!.address
                                                      .toString(),
                                                  otherProfileModel.data!.state
                                                      .toString(),
                                                  otherProfileModel.data!.city
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.location
                                                      .toString(),
                                                ],
                                              ),
                                              OtherUserProfileInfoWidgets(
                                                basicDetailValType: [
                                                  AppStrings.txt_Age,
                                                  AppStrings.txt_MaritalStatus,
                                                  AppStrings.txt_Dosham,
                                                  AppStrings
                                                      .txt_PartnerEducation,
                                                  AppStrings
                                                      .txt_PartnerOccupation,
                                                  AppStrings.txt_someOtherWords,
                                                ],
                                                basicDetailValues: [
                                                  otherProfileModel.data!.age
                                                      .toString(),
                                                  otherProfileModel
                                                      .data!.maritalStatus
                                                      .toString(),
                                                  AppStrings.txt_Dosham,
                                                  AppStrings
                                                      .txt_PartnerEducation,
                                                  AppStrings
                                                      .txt_PartnerOccupation,
                                                  AppStrings.txt_someOtherWords,
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Scaffold(
                body: Center(
                  child: Text(AppStrings.txtNoDataFound),
                ),
              );
      },
    );
  }
}
