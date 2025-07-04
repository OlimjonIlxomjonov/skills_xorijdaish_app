import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_wrapper.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/configs/assets/app_images.dart';
import '../../../../../core/page_route/route_generator.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';

class SingleCoursePaymentPage extends StatefulWidget {
  const SingleCoursePaymentPage({super.key});

  @override
  State<SingleCoursePaymentPage> createState() =>
      _SingleCoursePaymentPageState();
}

class _SingleCoursePaymentPageState extends State<SingleCoursePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      initialIndex: 2,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: appH(24), left: appW(10)),
            width: double.infinity,
            height: appH(300),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.singleCourse),
              ),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    AppRoute.close();
                  },
                  icon: Icon(
                    IconlyLight.arrow_left,
                    color: AppColors.white,
                    size: appH(24),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: appH(20)),
                  Text(
                    "Rossiya (Safar oldi ko'niktirish)",
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: appH(12)),
                  Row(
                    spacing: appW(18),
                    children: [
                      buildText('⭐ 4.9'),
                      buildText('🕑 20 Soat'),
                      buildText('🎥 32 ta video'),
                      buildText('🌐 Ru'),
                    ],
                  ),
                  SizedBox(height: appH(18)),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.source.bold(
                        color: AppColors.secondBlue,
                        fontSize: 28,
                      ),
                      text: '620 000 UZS  ',
                      children: [
                        TextSpan(
                          text: '1 200 000 UZS',
                          style: AppTextStyles.source
                              .semiBold(color: AppColors.textGrey, fontSize: 18)
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: appH(20)),
                  Text(
                    AppStrings.paymentMethod,
                    style: AppTextStyles.source.medium(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: appH(20)),
                  Row(
                    spacing: 20,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: appW(23),
                          vertical: appH(15),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff0C12211A)),
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff0C12211A),
                        ),
                        child: Image.asset(
                          AppImages.payMe,
                          width: appW(74),
                          height: appH(26),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: appW(23),
                          vertical: appH(15),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff0C12211A)),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.lightBlue.shade100,
                        ),
                        child: Image.asset(
                          AppImages.payMe,
                          width: appW(74),
                          height: appH(26),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  BasicButtonWg(
                    text: 'Sotib olish - 620 000 UZS',
                    onTap: () {},
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text buildText(String myText) {
    return Text(
      myText,
      style: AppTextStyles.source.medium(color: AppColors.black, fontSize: 14),
    );
  }
}
