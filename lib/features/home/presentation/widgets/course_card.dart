import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';

import '../../../../core/utils/responsiveness/app_responsive.dart';

class CourseCard extends StatelessWidget {
  final String image, text;
  final String richTextRate;
  final String richTextHours;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.richTextRate,
    required this.richTextHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.rusTiliKursi),
          SizedBox(height: appH(12)),
          Text(
            text,
            style: AppTextStyles.source.medium(
              color: AppColors.black,
              fontSize: 15,
            ),
          ),
          SizedBox(height: appH(17)),
          RichText(
            text: TextSpan(
              text: richTextRate,
              style: AppTextStyles.source.medium(
                color: Color(0xff0C1221),
                fontSize: 15,
              ),
              children: [TextSpan(text: richTextHours)],
            ),
          ),
          SizedBox(height: appH(18)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBg,
              foregroundColor: AppColors.white,
              minimumSize: Size(appW(200), appH(40)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            child: Text(AppStrings.kursniBoshlash),
          ),
        ],
      ),
    );
  }
}
