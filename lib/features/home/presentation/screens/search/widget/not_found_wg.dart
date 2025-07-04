import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class NotFoundWg extends StatelessWidget {
  final String result;

  const NotFoundWg({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "${AppStrings.result} '$result'",
              style: AppTextStyles.source.semiBold(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Text(
              '0 ta',
              style: AppTextStyles.source.semiBold(
                color: AppColors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: appH(20)),
        Image.asset(AppImages.searchNotFound),
        SizedBox(height: appH(28)),
        Text(
          AppStrings.malumotYoq,
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 24,
          ),
        ),
        SizedBox(height: appH(12)),
        Text(
          AppStrings.kechirasizSizKiritganKalit,
          textAlign: TextAlign.center,
          style: AppTextStyles.source.regular(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
