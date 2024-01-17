import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vishwakarmapatrika/features/find_partner/presentation/screen/find_partner_screen.dart';
import 'package:vishwakarmapatrika/features/home/presentation/screens/home_screen.dart';
import 'package:vishwakarmapatrika/features/profile/presentation/screens/profile_screen.dart';
import 'package:vishwakarmapatrika/features/shortlisted/presentation/screens/shortlisted_screen.dart';
import '../../../../core/constants/theme/app_colors.dart';
import '../../../auth/sign_in/model/signin_model.dart';

class BottomNavBarScreen extends StatefulWidget {
  final SignInModel signInModel;

  const BottomNavBarScreen({super.key, required this.signInModel});
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedIndex = 0;
  int badge = 0;
  final padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  double gap = 10;

  PageController controller = PageController();

  late List<Widget> screens;

  @override
  void initState() {
    screens = [
      HomeScreen(),
      const ShortlistedScreen(),
      FindPartnerScreen(),
      ProfileScreen(
        signInModel: widget.signInModel,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
            badge = badge + 1;
          });
        },
        controller: controller,
        itemBuilder: (context, position) {
          return screens[position];
        },
        itemCount: 4,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: const Offset(0, 25),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: GNav(
              tabs: [
                GButton(
                  gap: gap,
                  backgroundColor: AppColors.lightBlue,
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  gap: gap,
                  backgroundColor: AppColors.lightBlue,
                  iconSize: 24,
                  padding: padding,
                  text: 'Shortlisted',
                  icon: Icons.favorite_border,
                ),
                GButton(
                  gap: gap,
                  backgroundColor: AppColors.lightBlue,
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.link,
                  text: 'Partner',
                ),
                GButton(
                  gap: gap,
                  backgroundColor: AppColors.lightBlue,
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.person_2_outlined,
                  text: 'Profile',
                )
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
                controller.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
