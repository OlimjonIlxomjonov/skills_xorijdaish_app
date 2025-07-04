import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/app_bottom_nav.dart';
import 'package:skills_xorijdaish/features/auth/presentation/screens/auth_page.dart';

import '../../../core/page_route/route_generator.dart';
import '../../../core/services/token_storage/token_storage_service_impl.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final tokenStorage = TokenStorageServiceImpl();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      final token = tokenStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        AppRoute.open(AppBottomNav());
      } else {
        AppRoute.go(const AuthPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50, top: 55),
        child: Column(
          children: [
            SizedBox(
              height: appH(176),
              child: Image.asset(AppImages.iomLogo),
            ).animate().slideX(begin: -1, end: 0, delay: 2.seconds),

            Container(
              height: appH(176),
              color: AppColors.white,
              child: Image.asset(AppImages.swidLogo, width: double.infinity),
            ).animate().slideX(begin: 1, end: 0, delay: 2.seconds),

            Container(
              height: appW(176),
              color: AppColors.white,
              child: Image.asset(AppImages.complexLogo, width: double.infinity),
            ).animate().slideX(begin: -1, end: 0, delay: 2.seconds),

            SizedBox(
              height: appH(176),
              child: SvgPicture.asset(AppVectors.logo).animate(),
            ).animate().slideX(begin: 2, end: 0, delay: 2.seconds),
            Image.asset(AppImages.poweredBy),
          ],
        ),
      ),
    );
  }
}
