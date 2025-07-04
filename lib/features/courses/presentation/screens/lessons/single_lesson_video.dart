import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_wrapper.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:dotted_border/dotted_border.dart';

class SingleLessonVideo extends StatelessWidget {
  const SingleLessonVideo({super.key});

  @override
  Widget build(BuildContext context) {
    const double progress = 0.65;

    return BottomNavWrapper(
      initialIndex: 2,
      appBar: CustomAppBar(
        titleText: AppStrings.lessons,
        onTap: () {
          AppRoute.close();
        },
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rus Tili (Potent)',
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: appH(20)),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(milliseconds: 1000),
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: false,
                        lineHeight: appH(14),
                        percent: value,
                        backgroundColor: Colors.grey.shade200,
                        barRadius: Radius.circular(16),
                        progressColor: AppColors.secondBlue,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "${(value * 100).round()}%",
                      style: AppTextStyles.source.semiBold(
                        color: AppColors.secondBlue,
                        fontSize: 15,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: appH(20)),
            Image.asset(
              AppImages.video,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: appH(20)),
            buildContainer(
              "Qo’shimcha ma’lumotlar",
              Text(
                "Kurs bo’yicha ba’tafsil ma’lumotlar",
                style: AppTextStyles.source.regular(
                  color: AppColors.textGrey,
                  fontSize: 14,
                ),
              ),
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              dashPattern: [6, 4],
              color: Color(0xff9D97B5),
              strokeWidth: 1.5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade50,
                      spreadRadius: 1,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF7F7F8),
                    ),
                    child: Image.asset(AppImages.bookLamp),
                  ),
                  title: Text(
                    "Fe’llarning zamonlar bilan birgalikda ishlatilinishi",
                    style: AppTextStyles.source.regular(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    '867 Kb',
                    style: AppTextStyles.source.regular(
                      color: AppColors.textGrey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: appH(20)),
            buildContainer(
              "Test topshiriqlari",
              Column(
                spacing: 5,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bajarilgan',
                        style: AppTextStyles.source.regular(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '25%',
                        style: AppTextStyles.source.regular(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: false,
                    lineHeight: appH(8),
                    percent: 0.25,
                    backgroundColor: Colors.grey.shade200,
                    barRadius: Radius.circular(16),
                    progressColor: AppColors.secondBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(String title, Widget subTitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffF7F7F8),
          ),
          child: Image.asset(AppImages.bookLamp),
        ),
        title: Text(
          title,
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        subtitle: subTitle,
      ),
    );
  }

  Widget stripedProgressBar(double percent) {
    return Stack(
      children: [
        Container(
          height: appH(14),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percent,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  tileMode: TileMode.repeated,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.secondBlue, AppColors.white],
                  stops: [0.0, 0.5],
                ).createShader(bounds);
              },
              child: Container(
                height: appH(14),
                color: Colors.white, // This gets tinted by ShaderMask
              ),
            ),
          ),
        ),
      ],
    );
  }
}
