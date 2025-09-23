import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    _updateSystemUI(_currentIndex);
  }

  void _updateSystemUI(int index) {
    if (index == 3) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff1C1C25),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 3) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff1C1C25),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }

    return Stack(
      children: [
        Container(
          color: _currentIndex == 3 ? Color(0xff1C1C25) : AppColors.white,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: pages[_currentIndex],
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: appW(20), right: appW(20)),
              decoration: BoxDecoration(
                color: _currentIndex == 3 ? Color(0xff1C1C25) : AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                iconSize: appH(24),
                padding: EdgeInsets.symmetric(
                  horizontal: appW(16),
                  vertical: appH(12),
                ),
                tabMargin: EdgeInsets.symmetric(horizontal: appW(4)),
                backgroundColor:
                    _currentIndex == 3 ? Color(0xff1C1C25) : AppColors.white,
                activeColor: AppColors.textBlue,
                color: _currentIndex == 3 ? Color(0xff9E9E9E) : AppColors.black,
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() => _currentIndex = index);
                  if (index == 3) {
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                        systemNavigationBarColor: Color(0xff1C1C25),

                        systemNavigationBarIconBrightness: Brightness.light,
                      ),
                    );
                  } else {
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                        systemNavigationBarColor: Colors.white,
                        systemNavigationBarIconBrightness: Brightness.dark,
                      ),
                    );
                  }
                },
                tabs: [
                  GButton(
                    icon:
                        _currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
                  ),
                  GButton(
                    icon:
                        _currentIndex == 1
                            ? IconlyBold.chart
                            : IconlyLight.chart,
                  ),
                  GButton(
                    icon: IconlyBold.document,
                    leading: Container(
                      width: appW(44),
                      height: appH(44),
                      decoration: BoxDecoration(
                        color: AppColors.appBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(IconlyBold.document, color: AppColors.white),
                    ),
                  ),
                  GButton(
                    icon:
                        _currentIndex == 3 ? IconlyBold.play : IconlyLight.play,
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
        ),
      ],
    );
  }
}
