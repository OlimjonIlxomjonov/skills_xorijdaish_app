import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/text_field/custom_phone_textfield.dart';
import 'package:skills_xorijdaish/core/common/widgets/text_field/custom_textfield.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/auth/presentation/screens/auth_page.dart';
import 'package:skills_xorijdaish/features/app_bottom_nav.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.raqamliHukumatFoydala,
                    style: AppTextStyles.source.bold(
                      color: AppColors.black,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: appH(10)),
                  Text(
                    AppStrings.yagonaAkkaountOrqali,
                    style: AppTextStyles.source.regular(
                      color: AppColors.black,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: appH(30)),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffADD8E6).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            buildExpanded('Login', 0),
                            buildExpanded('Mobile-ID', 1),
                            buildExpanded('ERI', 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: appH(20)),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(0.0, 0.1),
                        end: Offset.zero,
                      ).animate(animation);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Container(
                      key: ValueKey<int>(selectedIndex),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildLoginFields(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: appH(80),
        child: Column(
          spacing: 10,
          children: [
            Divider(),
            RichText(
              text: TextSpan(
                text: AppStrings.tizimdaAkkYoqmi,
                style: AppTextStyles.source.medium(
                  color: AppColors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            AppRoute.go(AuthPage());
                          },
                    text: AppStrings.royhatdanOting,
                    style: AppTextStyles.source.medium(
                      color: AppColors.lightBlue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(String text, int index) {
    final isActive = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.source.semiBold(
              color: isActive ? AppColors.textBlue : AppColors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLoginFields() {
    switch (selectedIndex) {
      case 0:
        return [
          Text(
            AppStrings.login,
            style: AppTextStyles.source.semiBold(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          CustomTextfield(hintText: 'Login Kiriting', isPassword: false),
          SizedBox(height: appH(20)),
          Text(
            AppStrings.password,
            style: AppTextStyles.source.semiBold(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          CustomTextfield(hintText: 'Parolni Kiriting', isPassword: true),
          SizedBox(height: appH(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: AppStrings.loginYokiParol,
                  style: AppTextStyles.source.regular(
                    color: AppColors.lightBlue,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: AppStrings.yodingizdanChiqtimi,
                      style: AppTextStyles.source.regular(
                        color: AppColors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: appH(20)),
          BasicButtonWg(
            text: 'Davom etish',
            onTap: () {
              AppRoute.open(AppBottomNav());
            },
          ),
        ];

      case 1:
        return [
          Text(
            'Telefon raqamingiz',
            style: AppTextStyles.source.semiBold(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          CustomPhoneTextField(),
          SizedBox(height: appH(25)),
          BasicButtonWg(text: 'SMS Yuborish', onTap: () {}),
        ];

      case 2:
        return [
          Center(
            child: Text(
              'Soon!',
              style: AppTextStyles.source.semiBold(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ];

      default:
        return [];
    }
  }
}
