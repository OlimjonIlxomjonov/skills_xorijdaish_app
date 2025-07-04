import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';

class SertificationDetailsScreen extends StatelessWidget {
  const SertificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff35383F),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          color: AppColors.white,
          child: Center(child: Image.asset(AppImages.certificate)),
        ),
      ),
    );
  }
}
