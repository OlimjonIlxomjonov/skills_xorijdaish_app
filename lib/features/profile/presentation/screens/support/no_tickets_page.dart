import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class NoTicketsPage extends StatelessWidget {
  const NoTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: appH(150)),
        Image.asset(AppImages.searchNotFound),
        SizedBox(height: appH(28)),
        Text(
          "Tikketlar yo'q!",
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 24,
          ),
        ),
        SizedBox(height: appH(12)),
        Text(
          textAlign: TextAlign.center,
          style: AppTextStyles.source.regular(
            color: AppColors.black,
            fontSize: 16,
          ),
          'Sizda hech qanday tikketlar mavjud emas! Tikketlarni ko’rish uchun tikket yaratishingizni so’raymiz!',
        ),
      ],
    );
  }
}
