import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_route.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import '../../features/app_bottom_nav.dart';

class BottomNavWrapper extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final int initialIndex;

  const BottomNavWrapper({
    super.key,
    required this.child,
    this.initialIndex = 0,
    this.appBar,
  });

  @override
  _BottomNavWrapperState createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabChange(int newIndex) {
    if (newIndex == _currentIndex) return;
    AppRoute.open(AppBottomNav(initialIndex: newIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: widget.appBar,
      body: widget.child,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
