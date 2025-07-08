import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabChange;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: appH(20),
        left: appW(10),
        right: appW(10),
      ),
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
        selectedIndex: currentIndex,
        onTabChange: onTabChange,
        tabs: [
          GButton(icon: currentIndex == 0 ? IconlyBold.home : IconlyLight.home),
          GButton(
            icon: currentIndex == 1 ? IconlyBold.chart : IconlyLight.chart,
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
          GButton(icon: currentIndex == 3 ? IconlyBold.play : IconlyLight.play),
          GButton(
            icon: currentIndex == 4 ? IconlyBold.profile : IconlyLight.profile,
          ),
        ],
      ),
    );
  }
}
