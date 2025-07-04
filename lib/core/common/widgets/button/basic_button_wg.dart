import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class BasicButtonWg extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BasicButtonWg({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        minimumSize: Size(double.infinity, appH(51)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: AppColors.appBg,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: AppTextStyles.source.medium(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
