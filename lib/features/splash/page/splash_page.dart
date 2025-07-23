import 'dart:async';
import 'package:flutter/material.dart';
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
import '../../profile/domain/usecase/self_profile_use_case.dart';
import '../../profile/presentation/screens/self_information/user_info_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final tokenStorage = TokenStorageServiceImpl();
  bool showAnimation = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final token = await tokenStorage.getAccessToken();

    if (token != null && token.isNotEmpty) {
      final isValid = await _checkIfTokenIsValid(token);
      if (isValid) {
        setState(() {
          showAnimation = false;
        });
        await _loadUserInfo();
        AppRoute.open(const AppBottomNav());
      } else {
        await tokenStorage.deleteAccessToken();
        AppRoute.go(const AuthPage());
      }
    } else {
      Timer(const Duration(seconds: 3), () => AppRoute.go(const AuthPage()));
    }
  }

  Future<bool> _checkIfTokenIsValid(String token) async {
    try {
      final remoteDataSource = ProfileRemoteDataSourceImpl();
      final repository = ProfileRepoImpl(remoteDataSource);
      final useCase = SelfProfileUseCase(repository);
      final response = await useCase.call();
      logger.i(token);
      return true;
    } catch (e) {
      logger.e('❌ Token is invalid or expired: $e');
      return false;
    }
  }

  Future<void> _loadUserInfo() async {
    try {
      final remoteDataSource = ProfileRemoteDataSourceImpl();
      final repository = ProfileRepoImpl(remoteDataSource);

      final useCase = SelfProfileUseCase(repository);
      final sessionUseCase = SessionUseCase(repository);

      final sessionResponse = await sessionUseCase.call();

      final currentSession = sessionResponse.data.firstWhere(
        (element) => element.isMe == true,
      );

      final response = await useCase.call();
      userInfo.fullName = response.name;
      userInfo.sessionId = currentSession.id;

      // logger.i(
      //   'Loaded userInfo: ${userInfo.fullName}, sessionId: ${userInfo.sessionId}',
      // );
    } catch (e) {
      logger.e('❌ Error loading user info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body:
          showAnimation
              ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 55),
                  child: Column(
                    children: [
                      SizedBox(
                        height: appH(176),
                        child: Image.asset(AppImages.iomLogo),
                      ).animate().slideX(begin: -1, end: 0, delay: 1.seconds),

                      Container(
                        height: appH(176),
                        color: AppColors.white,
                        child: Image.asset(
                          AppImages.swidLogo,
                          width: double.infinity,
                        ),
                      ).animate().slideX(begin: 1, end: 0, delay: 1.seconds),

                      Container(
                        height: appW(176),
                        color: AppColors.white,
                        child: Image.asset(
                          AppImages.complexLogo,
                          width: double.infinity,
                        ),
                      ).animate().slideX(begin: -1, end: 0, delay: 1.seconds),

                      SizedBox(
                        height: appH(176),
                        child: SvgPicture.asset(AppVectors.logo).animate(),
                      ).animate().slideX(begin: 2, end: 0, delay: 1.seconds),

                      Image.asset(AppImages.poweredBy),
                    ],
                  ),
                ),
              )
              : Container(color: Colors.white),
    );
  }
}
