import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_xorijdaish/core/services/token_storage/token_storage_service_impl.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/app_bottom_nav.dart';
import 'package:skills_xorijdaish/features/auth/presentation/screens/auth_page.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/session_use_case.dart';
import '../../../core/common/constants/colors/app_colors.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/page_route/route_generator.dart';
import '../../../core/utils/responsiveness/app_responsive.dart';
import '../../profile/data/repo/profile_repo_impl.dart';
import '../../profile/data/source/profile_remote_data_source_impl.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final tokenStorage = TokenStorageServiceImpl();
  bool isReady = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _precacheAssets(context);
      setState(() => isReady = true);
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    final token = tokenStorage.getAccessToken();

    if (token != null && token.isNotEmpty) {
      final isValid = await _checkIfTokenIsValid(token);
      if (isValid) {
        AppRoute.open(AppBottomNav());
      } else {
        await tokenStorage.deleteAccessToken();
        AppRoute.open(AuthPage());
      }
    } else {
      Timer(Duration(seconds: 3), () => AppRoute.open(AuthPage()));
    }
  }

  Future<bool> _checkIfTokenIsValid(String token) async {
    try {
      final remoteDataSource = ProfileRemoteDataSourceImpl();
      final repository = ProfileRepoImpl(remoteDataSource);
      final sessionUseCase = SessionUseCase(repository);

      final sessionResponse = await sessionUseCase.call();

      return sessionResponse.data.any((e) => e.isMe == true);
    } catch (e) {
      logger.e('Token is invalid or expired: $e');
      return false;
    }
  }

  Future<void> _precacheAssets(BuildContext context) async {
    await precacheImage(AssetImage(AppImages.migLogo), context);
    await precacheImage(AssetImage(AppImages.poweredBy), context);
    await precacheImage(AssetImage(AppImages.iomLogo), context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.appBg,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    if (!isReady) {
      return Container(color: AppColors.appBg);
    }
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: appH(50), top: appH(55)),
          child: Column(
            children: [
              SizedBox(
                height: appH(176),
                child: Image.asset(
                  AppImages.iomLogo,
                  width: appW(328),
                  height: appH(89),
                  fit: BoxFit.contain,
                ),
              ).animate().slideX(begin: -2, end: 0, delay: 1.seconds),

              SizedBox(
                height: appH(176),
                child: SvgPicture.asset(
                  AppVectors.swidLogo,
                  width: double.infinity,
                  fit: BoxFit.none,
                ),
              ).animate().slideX(begin: 1, end: 0, delay: 1.seconds),

              SizedBox(
                height: appW(176),
                child: Image.asset(
                  AppImages.migLogo,
                  width: appW(269),
                  height: appH(70),
                ),
              ).animate().slideX(begin: -2, end: 0, delay: 1.seconds),

              SizedBox(
                height: appH(176),
                child: SvgPicture.asset(AppVectors.logo).animate(),
              ).animate().slideX(begin: 2, end: 0, delay: 1.seconds),
              Image.asset(AppImages.poweredBy),
            ],
          ),
        ),
      ),
    );
  }
}
