import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_wrapper.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/single_course/single_course_buy.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      initialIndex: 2,
      appBar: CustomAppBar(
        titleText: 'Darslar',
        onTap: () {
          AppRoute.close();
        },
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 20),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 9, bottom: 16),
              margin: EdgeInsets.only(bottom: appH(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.rusTiliKursi,
                    width: appW(372),
                    height: appH(164),
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Til (Basic)',
                    style: AppTextStyles.source.semiBold(
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '⭐4.9    📄45ta fayl    ▶ ️78ta video',
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 13,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(12, 18, 33, 0.0), // 0%
                          Color.fromRGBO(12, 18, 33, 0.2), // 50.43%
                          Color.fromRGBO(12, 18, 33, 0.0), // 100%
                        ],
                        stops: [0.0, 0.5043, 1.0],
                      ),
                    ),
                  ),
                  BasicButtonWg(
                    text: AppStrings.start,
                    onTap: () {
                      AppRoute.go(SingleCourseBuy());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
