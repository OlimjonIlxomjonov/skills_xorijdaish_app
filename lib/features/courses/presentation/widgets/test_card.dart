import 'package:flutter/material.dart';
import '../../../../core/common/constants/colors/app_colors.dart';
import '../../../../core/common/textstyles/app_text_styles.dart';

Widget card(Color color, double size, String? text, String task) {
  return Container(
    width: size,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: AppColors.lightBlue.withOpacity(0.5),
          blurRadius: 12,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task,
          style: AppTextStyles.source.medium(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
        Text(
          text ?? '',
          style: AppTextStyles.source.regular(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
