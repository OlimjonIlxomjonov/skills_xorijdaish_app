import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/courses_page.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/home/home_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/profile_page.dart';
import 'package:skills_xorijdaish/features/reels/presentation/screens/reels_page.dart';
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
    ReelsPage(),
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
              gap: 8,
              iconSize: appH(26),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                    width: appW(48),
                    height: appH(48),
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
