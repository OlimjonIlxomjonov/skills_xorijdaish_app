import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/courses_page.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/home/home_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/profile_page.dart';
import 'package:skills_xorijdaish/features/reels/presentation/screens/reels_screen.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/screens/statistic_page.dart';

class AppBottomNav extends StatefulWidget {
  final int initialIndex;

  const AppBottomNav({super.key, this.initialIndex = 0});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  late int _currentIndex;

  final List<Widget> pages = [
    HomePage(),
    StatisticPage(),
    CoursesPage(),
    ReelsScreen(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: pages[_currentIndex],
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // FIX 1
              gap: 8,
              iconSize: appH(24),
              // FIX 2: slightly smaller to prevent overflow
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              // FIX 3
              tabMargin: const EdgeInsets.symmetric(horizontal: 4),
              // FIX 4
              backgroundColor: AppColors.white,
              activeColor: AppColors.textBlue,
              color: Colors.black,
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() => _currentIndex = index);
              },
              tabs: [
                GButton(
                  icon: _currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
                ),
                GButton(
                  icon:
                      _currentIndex == 1 ? IconlyBold.chart : IconlyLight.chart,
                ),
                GButton(
                  icon: IconlyBold.document,
                  leading: Container(
                    width: appW(44), // FIX 5: slight shrink to prevent overflow
                    height: appH(44),
                    decoration: BoxDecoration(
                      color: AppColors.appBg,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(IconlyBold.document, color: AppColors.white),
                  ),
                ),
                GButton(
                  icon: _currentIndex == 3 ? IconlyBold.play : IconlyLight.play,
                ),
                GButton(
                  icon:
                      _currentIndex == 4
                          ? IconlyBold.profile
                          : IconlyLight.profile,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
